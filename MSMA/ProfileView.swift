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
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 2)
                    .frame(width: 120, height: 120)
                    .overlay(Text("Character").foregroundColor(.gray))

                ProgressView(value: 0.5)
                    .progressViewStyle(LinearProgressViewStyle(tint: .gray))
                    .scaleEffect(x: 1, y: 3, anchor: .center)
                    .frame(width: 300)
                    .padding(.top)
                
                
                
                HStack {
                    Text("Level 1")
                    Spacer()
                    Text("XP 100")
                }
                .padding(.horizontal, 50)
                .padding(.top, 4)
                
                Section{
                    Picker("Status", selection: $isActive) {
                        Text("Achievement").tag(true)
                        Text("Theme").tag(false)
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
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
        .navigationBarBackButtonHidden(true)
    }
}




#Preview {
    ProfileView()
}
