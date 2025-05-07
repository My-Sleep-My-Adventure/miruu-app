//
//  MSMAApp.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

@main
struct MSMAApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(generated: ThemeData(id: 1, name: "", description: "", caution: "", xp: 1, status: .complete, image: ""))
        }
    }
}
