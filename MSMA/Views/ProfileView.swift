//
//  ProfileView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct ProfileView: View {
    @Binding var themePicked: Bool?
    @Binding var pickedThemeId: Int?
    
    @State private var isActive: Bool = false
    var body: some View {
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
                        //                            .padding(.bottom, 10)
                    }else{
                        ThemeView()
                        //                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                }
                //                .background(Color("pickerbackground"))
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .bottomBar){
                    HStack{
                        Spacer()
                        NavigationLink(destination: HomeView(themePicked: $themePicked, pickedThemeId: $pickedThemeId)){
                            VStack {
                                Image(systemName: "house.fill")
                                    .imageScale(.large)
                                Text("Home")
                            }
                            .foregroundStyle(Color("foregroundGrey"))
                        }
                        .disabled(false) // not yet working
                        Spacer()
                        NavigationLink(destination: ProfileView(themePicked: $themePicked, pickedThemeId: $pickedThemeId)){
                            VStack {
                                Image(systemName: "person.fill")
                                    .imageScale(.large)
                                Text("Profile")
                            }
                            .foregroundStyle(Color("AccentColor"))
                        }
                        Spacer()
                    }
                    .padding(.top)
                    
                }
            }
    }
}

