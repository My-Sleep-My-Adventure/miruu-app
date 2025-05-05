//
//  AchievDetail.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct AchievDetail: View {
    let data: AchievementData
    
    var body: some View {
        Text("Achievement")
        Spacer()
        Text(data.name)
            .font(.title2)
            .bold()
//        RoundedRectangle(cornerRadius: 20)
//            .stroke( Color.black, lineWidth: 2)
//            .frame(width: 150, height: 150)
//            .padding(50)
        VStack {
            Image(data.image)
                .resizable() //
                .aspectRatio(contentMode: .fill) // Maintains aspect ratio
                .frame(width: 140, height: 200)
                .clipShape(Circle())
            
        }
        Text(data.description)
        Spacer()
        HStack {
            Spacer()
            VStack {
                Image(systemName: "house.fill")
                    .imageScale(.large)
                Text("Home")
            }
            Spacer()
            VStack {
                Image(systemName: "person.fill")
                    .imageScale(.large)
                Text("Profile")
            }
            Spacer()
        }
        .padding()
        .background(Color(UIColor.systemGray6))
    }
}

#Preview {
    AchievDetail(data: AchievementData(id: 1, name: "Achiev 1", description: "You Have successfully get achiement 1", image: "", status: false))
}
