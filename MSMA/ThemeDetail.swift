//
//  AchievDetail.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct ThemeDetail: View {
    let data: ThemeData
    var body: some View {
        Text("Achievement")
        Spacer()
        Text(data.name)
            .font(.title2)
            .bold()
        if data.status == .complete {
            Image(data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 96, height: 120)
//            Circle()
//                .stroke( Color.blue, lineWidth: 2)
//                .frame(width: 150, height: 150)
//                .padding(50)
        } else if data.status == .incomplete {
            Image(data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 96, height: 120)
//            RoundedRectangle(cornerRadius: 20)
//                .stroke( Color.black, lineWidth: 2)
//                .frame(width: 150, height: 180)
//                .padding(50)
        }

//        Spacer()
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
    ThemeDetail(data : ThemeData(id: 1, name: "theme", description: "description is description", caution: "", xp: 0, status:.complete, image:""))
}
