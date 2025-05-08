//
//  ContentView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("pickedThemeId") var pickedThemeId: Int?
    @AppStorage("pickedTheme") var pickedTheme: Bool?
    //@AppStorage("shuffleCount") var shuffleCount: Int = 3
    @State var shuffleCount: Int = 3
    var selectedTheme: ThemeData? {
            guard let id = pickedThemeId else { return nil }
            return data.listDataTheme.first { $0.id == id }
    }
    @State private var generated: ThemeData? = nil
    @State private var activeTheme = false
    @State var navigate = false
    @State var showPopup = false
    
    @State var data = Data()
    
    // State binding for key learning sheet
    @State private var isKeyLearningSheetPresented: Bool = false
    
    // State binding for keyLearningViewModel
    @StateObject var keyLearningViewModel = KeyLearningModel()

    var body: some View {
        NavigationStack {
            if pickedTheme! {
                pickedThemeView
                Spacer()
                //            ScrollView {
                NavigationView()
            }
            else {
                noPickedThemeView
                
            }
            //            .frame(maxHeight: 250)
            
        }
        //        .background(Color("milk"))
        .navigationBarBackButtonHidden(true)
    }
    
    private var pickedThemeView: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("7FC2CA"), Color("FFFFFF")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            if let selectedTheme = selectedTheme {
                VStack {
                    ZStack {
                        Image("cloud")
                        Button{
                            pickedTheme = false
                            pickedThemeId = nil
                        } label: {
                            Text("reset")
                        }
                        VStack {
                            HStack{
                                VStack(alignment: .leading){
                                    Text(selectedTheme.name)
                                        .font(.title)
                                        .bold()
                                    
                                    Text("23h 15m")
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                }
                                .padding()
                                
                                Spacer()
                                
                                DisplayGif(gifName: "dragonform2", size: 160)
                                    .frame(maxWidth: 160, maxHeight: 160)
                                //                                .background(Color.white)
                                
                                //                            .background(Color.white)
                                //                        RoundedRectangle(cornerRadius: 20)
                                //                            .stroke(Color.white, lineWidth: 2)
                                //                            .frame(width: 80, height: 80)
                                //                            .overlay(Text("Character").foregroundColor(.white))
                            }
                            .padding()
                        }
                    }
                    
                    //                    .padding()
                    //                                        .background(Color.red)
                    
                    VStack(spacing: 15) {
                        ForEach(0..<5) { index in
                            //                            Button{} label: {
                            HStack {
                                ZStack{
                                    //                                    Image("tabcard\(index+1)")
                                    HStack{
                                        VStack{
                                            Circle()
                                                .foregroundStyle(.white)
                                                .background(Color("FCF5EF"))
                                                .frame(width: 50, height: 50)
                                                .overlay(Image("cardicon\(index+1)"))
                                            
                                            
                                            
                                        }
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(Color("E0610B"))
                                    }
                                    
                                    Spacer()
                                    VStack(alignment: .leading){
                                        Text(selectedTheme.challenges[index].name)
                                            .foregroundStyle(.black)
                                            .font(.system(size: 18))
                                            .bold()
                                        
                                        Text(selectedTheme.challenges[index].description)
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 16))
                                            .lineLimit(1) // show only one line
                                            .truncationMode(.tail)
                                        
                                    }
                                    .frame(width: 220)
                                    .padding(.leading, 20)
                                    Spacer()
                                    Spacer()
                                }
                                
                            }
                            .padding()
                            .frame(maxWidth: 340, maxHeight: 75)
                            .background(Color("FCF5EF"))
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color("A5D4DA"), lineWidth: 1)
                            )
                            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                            //                            }
                            
                        }
                    }
                    .padding(.horizontal)
                    //            }
                    Spacer()
                    Button {
                        isKeyLearningSheetPresented.toggle()
                    } label: {
                        Text("Complete")
                            .foregroundStyle(Color("milk"))
                            .padding(.vertical, 20)
                            .frame(maxWidth: 165, maxHeight: 50)
                            .background(Color("E0610B"))
                            .fontWeight(.bold)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .sheet(isPresented: $isKeyLearningSheetPresented) {
                        EditableRectangularImageDocumentation(viewModel: keyLearningViewModel)
                    }
                    Spacer()
                    Spacer()
                }
            }
        }
        
    }
    
    private var noPickedThemeView: some View {
            ZStack {
                Image("backgroundImage1")
                    .resizable()
                    .aspectRatio(contentMode:.fill)
                    .ignoresSafeArea(edges: .all)
                
                VStack{
                    VStack{
                        Text("Miruu").font(.system(size: 36, weight: .bold)).foregroundStyle(Color("darkBlue"))
                            .shadow(color: Color("AccentColor"),radius: 2)
                        DisplayGif(gifName: "dragonform2", size: 150)
                        
                    }
                    VStack{
                        if activeTheme, let generated = generated{
                            Text(generated.name).font(.title).fontWeight(.bold).foregroundStyle(Color("darkBlue"))
                            Text(generated.description).font(.caption).multilineTextAlignment(.center)
                        }
                    }
                    .frame(width: 307, height: 70)
                    .padding(.bottom, 47)
                    
                    VStack(alignment: .leading){
                        Text("\(shuffleCount)/3").padding(.leading, 20).foregroundStyle(Color("darkBlue"))
                        HStack(spacing: 20){
                            Button {
                                if shuffleCount > 0{
                                    generated = data.generateData()
                                    navigate = true
                                    showPopup = true
                                    shuffleCount -= 1
                                    if !activeTheme{
                                        activeTheme = true
                                    }
                                }
                            } label: {
                                Image(systemName: "shuffle")
                                    .foregroundStyle(Color("AccentColor"))
                                    .frame(width: 65,height: 55)
                                    .background(Color("milk"))
                                    .font(.system(size: 24, weight: .bold))
                            }
                            .cornerRadius(5)
                            .shadow(radius: 4, x:0, y:4)
                            
                            Button {
                                if activeTheme{
                                    pickedTheme = true
                                    pickedThemeId = generated?.id
                                    print(pickedTheme!)
                                }
                            } label: {
                                Text("Ambil Tema")
                                    .foregroundStyle(Color(activeTheme ? "milk" : "foregroundGrey"))
                                    .padding(.vertical, 20)
                                    .frame(maxWidth: 200)
                                    .background(Color(activeTheme ? "AccentColor" : "backgroundGrey"))
                                    .fontWeight(.bold)
                            }
                            .disabled(!activeTheme)
                            .cornerRadius(6)
                            .shadow(radius: activeTheme ? 4 : 0, x:0, y: activeTheme ? 4 : 0)
                        }
                    }
                    Spacer()
                }
                .padding(.vertical, 170)
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar){
                    HStack{
                        Spacer()
                        NavigationLink(destination: HomeView()){
                            VStack {
                                Image(systemName: "house.fill")
                                    .imageScale(.large)
                                Text("Home")
                            }
                            .foregroundStyle(Color("AccentColor"))
                        }
                        .disabled(!pickedTheme!)
                        Spacer()
                        NavigationLink(destination: ProfileView()){
                            VStack {
                                Image(systemName: "person.fill")
                                    .imageScale(.large)
                                Text("Profile")
                            }
                            .foregroundStyle(Color("foregroundGrey"))
                        }
                        Spacer()
                    }
                    .padding(.top)
                    
                }
            }
        .fullScreenCover(isPresented: $showPopup) {
            PopUpView(isPresented: $showPopup, generated: $generated, navigate: $navigate)
                .interactiveDismissDisabled(true)
        }
        .onChange(of: pickedTheme){
            activeTheme = pickedTheme!
        }
    }
}




#Preview {
    HomeView()
}
