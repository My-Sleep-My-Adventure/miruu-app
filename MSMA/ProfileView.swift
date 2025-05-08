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
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("7FC2CA"), Color("FFFFFF")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                VStack {
                    LevelProgress()
                    
                    Section{
                        Picker("Status", selection: $isActive) {
                            
                            Text("Achievement").tag(true)
                                .padding()
                            Text("Theme").tag(false)
                                .foregroundStyle(Color.red)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.blue)
                                )
                                .tint(Color.blue)
                                
                            
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color("pickerbackground"))
                        )
                        .padding()
                    }
                    
                    
                    if isActive {
                        AchievementView()
                    }else{
                        ThemeView()
                    }
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
