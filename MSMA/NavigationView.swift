//
//  NavigationView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct NavigationView: View {
//    @Binding var generated: ThemeData
    
    var body: some View {
        NavigationStack {
            HStack {
                Spacer()
                NavigationLink(destination: HomeView()){
                    VStack {
                        Image(systemName: "house.fill")
                            .imageScale(.large)
                        Text("Home")
                    }
                    .foregroundColor(.black)
                }

                Spacer()
                NavigationLink(destination: ProfileView()){
                    VStack {
                        Image(systemName: "person.fill")
                            .imageScale(.large)
                        Text("Profile")
                    }
                    .foregroundColor(.black)
                }
                
                Spacer()
            }
            .padding()
            .background(Color("milk"))
        }
        
    }
}

//#Preview {
//    NavigationView()
//}
