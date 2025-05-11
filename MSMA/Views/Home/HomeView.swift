//
//  test.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 08/05/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navModel: NavigationModel
    
    // Storage for theme picked. Ensure that when user quit the application, it will save the current theme id.
    @AppStorage("pickedThemeId") var pickedThemeId: Int?
    @AppStorage("themePicked") var themePicked: Bool?
    
    var body: some View {
//<<<<<<< HEAD:MSMA/Views/test.swift
//        TabView{
//            if let themePicked = themePicked{
//                if themePicked == true {
//                    HomeView(themePicked: $themePicked, pickedThemeId: $pickedThemeId)
//                        .tabItem {
//                            Label("Home", systemImage: "house")
//                        }
//                }
//                else {
//                    ContentView(pickedThemeId: $pickedThemeId, themePicked: $themePicked)
//                        .tabItem {
//                            Label("Home", systemImage: "house")
//                        }
//=======
        TabView(selection: $navModel.currentTab) {
            Group {
                if let themePicked = themePicked, themePicked {
                    QuestView(themePicked: $themePicked, pickedThemeId: $pickedThemeId)
                } else {
                    ShuffleThemeView(pickedThemeId: $pickedThemeId, themePicked: $themePicked)
//>>>>>>> main:MSMA/Views/Home/HomeView.swift
                }
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(Tab.home)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
                .tag(Tab.profile)
        }
    }
}


#Preview {
    HomeView()
        .environmentObject(NavigationModel())
        .environmentObject(Data())
}
