//
//  ProfileView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var navModel: NavigationModel
    
    @State private var isActive: Bool = true
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color("7FC2CA"), Color("FFFFFF")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    VStack{
                        ZStack{
                            ZStack{
                                Image("cloud")
                            }
                            VStack{
                                LevelProgress()
                                
                                Section{
                                    Picker("Status", selection: $isActive) {
                                        
                                        Text("Pencapaian").tag(true)
                                            .font(.system(size: 16, weight: .bold, design: .rounded))
                                            .padding()
                                            .foregroundStyle(.white)
                                        Text("Tema").tag(false)
                                            .font(.system(size: 16, weight: .bold, design: .rounded))
                                            .padding()
                                            .foregroundStyle(.white)
                                            .background(
                                                RoundedRectangle(cornerRadius: 25)
                                                    .fill(Color.blue)
                                            )
                                            .tint(Color.blue)
                                        
                                        
                                    }
                                    .pickerStyle(SegmentedPickerStyle())
                                    .padding(8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(Color("pickerbackground"))
                                    )
                                    .padding()
                                }
                                .padding(.bottom,5)
                                
                            }
                        }
                    }
                    .padding()
                    
                    
                    if isActive {
                        AchievementView()
                            .frame(maxHeight: .infinity)
                    } else {
                        ThemeView()
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

