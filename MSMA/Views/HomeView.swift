//
//  ContentView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var themePicked: Bool?
    @Binding var pickedThemeId: Int?
    
    var selectedTheme: ThemeData? {
        guard let id = pickedThemeId else { return nil }
        return data.listDataTheme.first { $0.id == id }
    }

    @State var data = Data()
    
    // State binding for key learning sheet
    @State private var isKeyLearningSheetPresented: Bool = false
    
    // State binding for keyLearningViewModel
    @StateObject var keyLearningViewModel = KeyLearningModel()

    var body: some View {
        VStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("7FC2CA"), Color("FFFFFF")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                if let selectedTheme = selectedTheme {
                    VStack {
                        ZStack {
                            Image("cloud")
                            Button{
                                themePicked = false
                                pickedThemeId = nil
                                dismiss()
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
                                }
                                .padding()
                            }
                        }
                        
                        //                    .padding()
                        //                                        .background(Color.red)
                        
                        VStack(spacing: 15) {
                            ForEach(0..<5) { index in
                                //                            Button{} label: {
                                NavigationLink{
                                    DetailChallengeView()
                                }
                                label: {
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
                                }
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
                                .frame(maxWidth: 323, maxHeight: 50)
                                .background(Color("E0610B"))
                                .fontWeight(.bold)
                        }
                        .cornerRadius(20)
                        .shadow(radius: 4, y: 4)
                        .sheet(isPresented: $isKeyLearningSheetPresented) {
                            EditableRectangularImageDocumentation(viewModel: keyLearningViewModel)
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 80)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar){
                    HStack{
                        Spacer()
                        NavigationLink(destination: HomeView(themePicked: $themePicked, pickedThemeId: $pickedThemeId)){
                            VStack {
                                Image(systemName: "house.fill")
                                    .imageScale(.large)
                                Text("Home")
                            }
                            .foregroundStyle(Color("AccentColor"))
                        }
                        .disabled(true)
                        Spacer()
                        NavigationLink(destination: ProfileView(themePicked: $themePicked, pickedThemeId: $pickedThemeId)){
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
            .navigationBarBackButtonHidden(true)
        }
        
    }
}


