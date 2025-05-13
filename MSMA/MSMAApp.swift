//
//  MSMAApp.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI
import SwiftData
import TipKit

@main
struct MSMAApp: App {
    @StateObject private var navModel = NavigationModel()
    @StateObject private var data = Data()
    @StateObject private var levelController = LevelProgressController()
    
    init() {
        let appearance = UIToolbarAppearance()
        appearance.backgroundColor = UIColor(named: "FFFFFF")?.withAlphaComponent(50)
        UIToolbar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UIToolbar.appearance().scrollEdgeAppearance = appearance
        }
        
        try? Tips.configure()
    }

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(navModel)
                .environmentObject(data)
                .environmentObject(levelController)
                .preferredColorScheme(.light)
        }
        .modelContainer(for: [Story.self])
    }
}
