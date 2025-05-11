//
//  ContentView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navModel: NavigationModel
    @Environment(\.dismiss) var dismiss
    @Binding var themePicked: Bool?
    @Binding var pickedThemeId: Int?
    
    @State private var showCompletionPopup = false
    @State private var animatePopup = false
    
    var selectedTheme: ThemeData? {
        guard let id = pickedThemeId else { return nil }
        return data.listDataTheme.first { $0.id == id }
    }

//    @State var data = Data()
    @EnvironmentObject var data : Data 
    
    // State binding for key learning sheet
    @State private var isKeyLearningSheetPresented: Bool = false
    
    // State binding for keyLearningViewModel
    @StateObject var keyLearningViewModel = KeyLearningModel()

    var body: some View {
        NavigationStack {
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
                                    navModel.path = NavigationPath()
                                    navModel.path.append(Route.home)
                                } label: {
                                    Text("reset")
                                }
                                VStack {
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text(selectedTheme.name)
                                            // Font rounded
                                                .font(.title)
                                                .fontDesign(.rounded)
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
                                    NavigationLink{
                                        DetailChallengeView(challenge: selectedTheme.challenges[index])
                                        //                                    if let challenge = selectedTheme.challenges[ {
                                        //                                        DetailChallengeView(challenge: challenge)
                                        //                                    }
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
                                if let pickedId = pickedThemeId,
                                   let index = data.listDataTheme.firstIndex(where: { $0.id == pickedId }) {
                                    data.listDataTheme[index].status = .complete
                                }

                                withAnimation {
                                    showCompletionPopup = true
                                    animatePopup = true
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    // Animate popup disappearing
                                    withAnimation {
                                        animatePopup = false
                                    }

                                    // Second delay to allow popup hide animation to finish
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                                        showCompletionPopup = false

                                        // Navigate to Profile
                                        navModel.path.append(Route.profile)
                                        navModel.currentRoute = .profile
                                    }
                                }
//                                if let pickedId = pickedThemeId,
//                                   let index = data.listDataTheme.firstIndex(where: { $0.id == pickedId }) {
//                                    data.listDataTheme[index-1].status = .complete
//                                }
//                                print(data.listDataTheme[pickedThemeId!-1].name, data.listDataTheme[pickedThemeId!].status)
////                                data.listDataTheme[index].status
                                
//                                isKeyLearningSheetPresented.toggle()
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
                
//                .toolbar {
//                    ToolbarItem(placement: .bottomBar){
//                        HStack{
//                            Spacer()
//                            Button{
//                                navModel.path.append(Route.main)
//                                navModel.currentRoute = Route.main
//                            }label: {
//                                VStack {
//                                    Image(systemName: "house.fill")
//                                        .imageScale(.large)
//                                    Text("Home")
//                                }
//                                .foregroundStyle(Color(navModel.currentRoute == Route.main ? "AccentColor" : "foregroundGrey"))
//                            }
//                            .disabled(navModel.currentRoute == Route.main)
//                            Spacer()
//                            Button{
//                                navModel.path.append(Route.profile)
//                                navModel.currentRoute = Route.profile
//                            }label: {
//                                VStack {
//                                    Image(systemName: "person.fill")
//                                        .imageScale(.large)
//                                    Text("Profile")
//                                }
//                                .foregroundStyle(Color(navModel.currentRoute == Route.profile ? "AccentColor" : "foregroundGrey"))
//                            }
//                            .disabled(navModel.currentRoute == Route.profile)
//                            Spacer()
//                        }
//                        .padding(.top)
//                        
//                    }
//                }
                
            }
            .overlay(
                Group {
                    if showCompletionPopup, let theme = selectedTheme {
                        ZStack {
                            Color.black.opacity(0.4)
                                .edgesIgnoringSafeArea(.all)
                                .onTapGesture {
                                    withAnimation {
                                        animatePopup = false
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        showCompletionPopup = false
                                    }
                                }

                            VStack {
                                Image(theme.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                    .scaleEffect(animatePopup ? 1 : 0.5)
                                    .opacity(animatePopup ? 1 : 0)
                                    .animation(.spring(), value: animatePopup)

                                Text("Theme Completed!")
                                    .font(.title2)
                                    .bold()
                                    .padding(.top)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(Color("7FC2CA"))
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .padding(40)
                        }
                        .transition(.opacity)
                    }
                }
            )

            .navigationBarBackButtonHidden(true)
        }
        
    }
}


