//
//  test.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 08/05/25.
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navModel: NavigationModel
    
    // Create a single instance of QuestController for the entire app
    @StateObject var questController = QuestController()
    
    var body: some View {
        TabView(selection: $navModel.currentTab) {
            Group {
                if let themePicked = questController.themePicked, themePicked {
                    QuestView(
                        themePicked: $questController.themePicked,
                        pickedThemeId: $questController.pickedThemeId
                    )
                    .environmentObject(questController)
                    .onAppear {
                        questController.checkAndResetThemeIfNeeded()
                    }
                } else {
                    ShuffleThemeView(
                        pickedThemeId: $questController.pickedThemeId,
                        themePicked: $questController.themePicked,
                        questController: questController
                    )
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
        .tint(Color.accent)
        // Add an app-wide timer check to ensure theme resets even when in other tabs
        .onReceive(Timer.publish(every: 60, on: .main, in: .common).autoconnect()) { _ in
            questController.checkAndResetThemeIfNeeded()
        }
    }
}


#Preview {
    HomeView()
        .environmentObject(NavigationModel())
}
