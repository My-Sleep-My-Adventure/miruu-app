//
//  ProfileView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct ProfileView: View {
    
    
    
    @State private var isActive: Bool = false
    var body: some View {
        NavigationStack{
            
            VStack {
                Circle
                
                ProgressView(value: 0.5)
                    .progressViewStyle(LinearProgressViewStyle(tint:    Color("brown")))
                    .scaleEffect(x: 1, y: 3, anchor: .center)
                    .frame(width: 300)

                HStack {
                    Text("Level 1")
                    Spacer()
                    Text("XP 100")
                }
                .padding(.horizontal, 50)
//                .padding(.vertical, 4)
                
                Section{
                    Picker("Status", selection: $isActive) {
                        Text("Achievement").tag(true)
                        Text("Theme").tag(false)
                        
                    }
                    .background(Color("purple"))
                    .pickerStyle(SegmentedPickerStyle())
                    .foregroundStyle(.white)
                    .tint(Color("purple"))
                    .padding()
                }
                
                
                if isActive {
                    AchievementView()
                }else{
                    ThemeView()
                }
            }
            
            Spacer()
            NavigationView()
        }
        .background(Color("milk"))
        .navigationBarBackButtonHidden(true)
    }
}




#Preview {
    ProfileView()
}
