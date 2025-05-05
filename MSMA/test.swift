////
////  test.swift
////  MSMA
////
////  Created by M Ikhsan Azis Pane on 04/05/25.
////
//
//import SwiftUI
//
//struct Test: View {
//    @State private var selectedTab = 0 // 0 = Tasks, 1 = Activity, 2 = Timer
//
//    init() {
//        let appearance = UITabBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = UIColor.systemGray3
//        
//        appearance.stackedLayoutAppearance.normal.iconColor = .gray
//        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
//        
//        appearance.stackedLayoutAppearance.selected.iconColor = .bgLabelToday
//        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.bgLabelToday]
//
//        UITabBar.appearance().standardAppearance = appearance
//        if #available(iOS 15.0, *) {
//            UITabBar.appearance().scrollEdgeAppearance = appearance
//        }
//    }
//
//    var body: some View {
//        TabView(selection: $selectedTab) {
//            ActivityInputView(selectedTab: $selectedTab) // Pass binding ke ActivityInputView
//                .tabItem {
//                    Image(systemName: "list.bullet")
//                    Text("Tasks")
//                }
//                .tag(0)
//
//            AvailableTimeView(selectedTab: $selectedTab)
//                .tabItem {
//                    Image(systemName: "calendar")
//                    Text("Activity")
//                }
//                .tag(1)
//            
//            TimerView(selectedTab: $selectedTab)
//                .tabItem {
//                    Image(systemName: "clock")
//                    Text("Timer")
//                }
//                .tag(2)
//        }
//    }
//}
//
//#Preview {
//    test()
//}
