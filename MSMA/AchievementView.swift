//
//  AchievementView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct AchievementView: View {
    @State private var data = Data()
    //    var limit = data.listData.count
    
    var body: some View {
        NavigationStack{
            Text("\(data.unlockedCountAchievement)/\(data.listDataAchievement.count)")
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 20) {
                    ForEach(0..<data.listDataAchievement.count) { index in
                        VStack {
                            if data.listDataAchievement[index].status {
                                NavigationLink(destination: AchievDetail(data: data.listDataAchievement[index])) {
                                    VStack {
                                        
                                        Image("achiev\(index+1)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 70, height: 100)
//                                            .clipShape(Circle())
                                        
                                        Text(data.listDataAchievement[index].name)
                                            .font(.caption)
                                            .foregroundColor(.black)
                                        
                                    }
                                }
                                
                            } else {
                                VStack {
                                    Circle()
                                        .stroke(Color.gray, lineWidth: 2)
                                        .frame(width: 70, height: 100)
                                        .overlay(
                                            Text("?")
                                                .font(.title)
                                                .foregroundColor(.gray)
                                        )
                                    
                                    Text(data.listDataAchievement[index].name)
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .background(Color("milk"))
    }
}

#Preview {
    AchievementView()
}
