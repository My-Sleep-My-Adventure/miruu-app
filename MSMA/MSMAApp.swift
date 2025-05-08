//
//  MSMAApp.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI
import SwiftData

@main
struct MSMAApp: App {
    init() {
        let appearance = UIToolbarAppearance()
        appearance.backgroundColor = UIColor(named: "FFFFFF")?.withAlphaComponent(50)
        UIToolbar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UIToolbar.appearance().scrollEdgeAppearance = appearance
        }
    }

    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(for: Story.self)
        }
    }
}
