//
//  test.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 08/05/25.
//

import SwiftUI

struct test: View {
    @EnvironmentObject var navModel: NavigationModel
    @AppStorage("pickedThemeId") var pickedThemeId: Int?
    @AppStorage("themePicked") var themePicked: Bool?
    
    var body: some View {
        TabView{
            if let themePicked = themePicked{
                if themePicked == true{
                    HomeView(themePicked: $themePicked, pickedThemeId: $pickedThemeId)
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                }
                else {
                    ContentView(pickedThemeId: $pickedThemeId, themePicked: $themePicked)
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                }
            }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}




#Preview {
    test()
        .environmentObject(NavigationModel())
}
