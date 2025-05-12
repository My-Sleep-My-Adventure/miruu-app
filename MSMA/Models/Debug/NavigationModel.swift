//
//  NavigationModel.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 11/05/25.
//


import Foundation
import SwiftUI

class NavigationModel: ObservableObject {
    @Published var path = NavigationPath()
    @Published var currentRoute: Route = .main
    @Published var currentTab: Tab = .home
}

// Tab routing
enum Tab {
    case home, profile
}

enum Route {
    case home
    case main
    case profile
}
