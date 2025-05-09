//
//  ContentView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navModel: NavigationModel
    @AppStorage("pickedThemeId") var pickedThemeId: Int?
    @AppStorage("themePicked") var themePicked: Bool?
    
    @State private var shuffleCount: Int = 3
    @State private var data = Data()
    @State var generated: ThemeData? = nil
    @State private var activeTheme = false
    @State var navigate = false
    @State var showPopup = false
    
    @State private var cardRotation: Double = -450
    @State private var cardID = UUID()
    
    var body: some View {
        NavigationStack(path: $navModel.path){
            ZStack {
                Image("backgroundImage1")
                    .resizable()
                    .aspectRatio(contentMode:.fill)
                    .ignoresSafeArea(edges: .all)
                
                VStack{
                    VStack{
                        Text("Miruu")
                            .font(.system(size: 46, weight: .bold, design: .rounded))                            .foregroundStyle(Color("E0610B"))
                            .shadow(color: .white,radius: 1)
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
                                if shuffleCount > 0 {
                                    generated = data.generateData()
                                    pickedThemeId = generated?.id
                                    navigate = true
                                    cardRotation = -90
                                    cardID = UUID()
                                    showPopup = true
                                    shuffleCount -= 1
                                    if !activeTheme {
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
                            
//                            Button{
//                                if activeTheme {
//                                    themePicked = true
//                                    pickedThemeId = generated?.id
//                                    path.append(Route.main)
//                                }
//                            } label: {
//                                Text("Ambil Tema")
//                                    .foregroundStyle(Color(activeTheme ? "milk" : "foregroundGrey"))
//                                    .padding(.vertical, 20)
//                                    .frame(maxWidth: 200)
//                                    .background(Color(activeTheme ? "AccentColor" : "backgroundGrey"))
//                                    .fontWeight(.bold)
//                            }
//                            .disabled(!activeTheme)
//                            .cornerRadius(6)
//                            .shadow(radius: activeTheme ? 4 : 0, x:0, y: activeTheme ? 4 : 0)
                            
                            Button{
                                if activeTheme {
                                    themePicked = true
                                    pickedThemeId = generated?.id
                                    navModel.path.append(Route.main)
                                    navModel.currentRoute = .main
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
                if showPopup {
                    PopUpView(
                        isPresented: $showPopup,
                        generated: $generated,
                        navigate: $navigate,
                        rotationAngle: cardRotation,
                        cardID: cardID
                    )
                    .zIndex(2)
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar){
                    HStack{
                        Spacer()
                        Button{
                            navModel.path.append(Route.main)
                            navModel.currentRoute = Route.main
                        }label: {
                            VStack {
                                Image(systemName: "house.fill")
                                    .imageScale(.large)
                                Text("Home")
                            }
                            .foregroundStyle(Color(navModel.currentRoute == Route.main ? "AccentColor" : "foregroundGrey"))
                        }
                        .disabled(navModel.currentRoute == Route.main)
                        Spacer()
                        Button{
                            navModel.path.append(Route.profile)
                            navModel.currentRoute = Route.profile
                        }label: {
                            VStack {
                                Image(systemName: "person.fill")
                                    .imageScale(.large)
                                Text("Profile")
                            }
                            .foregroundStyle(Color(navModel.currentRoute == Route.profile ? "AccentColor" : "foregroundGrey"))
                        }
                        .disabled(navModel.currentRoute == Route.profile)
                        Spacer()
                    }
                    .padding(.top)
                    
                }
            }
            .navigationDestination(for: Route.self){route in
                switch route{
                case .home:
                    ContentView()
                case .main:
                    HomeView(themePicked: $themePicked, pickedThemeId: $pickedThemeId)
                case .profile:
                    ProfileView(themePicked: $themePicked, pickedThemeId: $pickedThemeId)
                }
            }
            .onAppear {
                let themePicked = themePicked ?? false
                if themePicked,
                   let id = pickedThemeId,
                   data.listDataTheme.contains(where: { $0.id == id }) {
                    navModel.path.append(Route.main)
                    navModel.currentRoute = .main
                }
            }

            .onChange(of: themePicked){
                activeTheme = themePicked ?? true
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}

#Preview {
    ContentView()
        .environmentObject(NavigationModel())
}

