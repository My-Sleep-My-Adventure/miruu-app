//
//  MSMAApp.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

@main
struct MSMAApp: App {
    init() {
        let appearance = UIToolbarAppearance()
        appearance.backgroundColor = UIColor(named: "milk")
        UIToolbar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UIToolbar.appearance().scrollEdgeAppearance = appearance
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
