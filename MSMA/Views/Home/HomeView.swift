//
//  test.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 08/05/25.


import SwiftUI

struct HomeView: View {
    // Environment for modelContext
    @Environment(\.modelContext) private var modelContext
    
    @EnvironmentObject var navModel: NavigationModel
    
    // Create a single instance of QuestController for the entire app
    @StateObject var questController = QuestController()
    
    // Injek StateObject di main root karena Quest Nested dan Level Progress beda path asu
    @StateObject var levelController = LevelProgressController()
    
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
                .environmentObject(levelController)
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
        .environmentObject(Data())
}
