//
//  AchievementView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct AchievementView: View {
    @EnvironmentObject var data: Data
    //    var limit = data.listData.count
    
    var body: some View {
        VStack(){
            HStack(){
                Text("Daftar Pencapaian")
                    .font(.system( size: 16, weight: .bold, design: .rounded))
                    .font(.title3)
                Spacer()
                Text("\(data.unlockedCountAchievement)/\(data.listDataAchievement.count)")
                    .font(.system(size: 15, design: .rounded))
                    .foregroundStyle(Color.gray)
            }
            .padding(.top)
            .padding(.horizontal, 30)
            
            
            
            VStack() {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 5) {
                    ForEach(0..<data.listDataAchievement.count) { index in
                        VStack {
                            if data.listDataAchievement[index].status {
                                NavigationLink(destination: AchievementDetail(data: data.listDataAchievement[index])) {
                                    VStack {
                                        
                                        Image("achiev\(index+1)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 85, height: 85)
 
                                        //                                            .clipShape(Circle())
                                        
                                        Text(data.listDataAchievement[index].name)
                                            .font(.caption)
                                            .bold()
                                            .foregroundColor(.black)
                                        
                                    }
                                    .padding(.bottom, 8)
                                }
                                
                            } else {
                                VStack {
                                    
                                    Image("lockachieve")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 85, height: 85)
              
                                    
                                    Text("Locked")
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(.black)
                                    
                                }
                                .padding(.bottom, 8)
                            }
                        }
                        .padding(.bottom, 8)
                        
                    }
                }
            }
            
            .padding()
        }
        .frame(alignment: .top)
        .background(Color("FEFCFA").opacity(0.7))       .clipShape(RoundedRectangle(cornerRadius: 20))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
    }
}

#Preview {
    AchievementView()
}

