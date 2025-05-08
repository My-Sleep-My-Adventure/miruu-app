//
//  AchievDetail.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct ThemeDetail: View {
    @Environment(\.presentationMode) var presentationMode
    
    let data: ThemeData
    var body: some View {
        ZStack {
            
            Color("A5D4DA")
                .ignoresSafeArea(.all)
//            ZStack {
//                Spacer()
//                Spacer()
//                Image("cloud2")
//            }
            VStack {
                Spacer()
                Image("cloud3")
                
            }
            .ignoresSafeArea(.all)
            
            VStack {
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
            }
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Theme")
        .foregroundStyle(.black)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {presentationMode.wrappedValue.dismiss()}){
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                }
            }
            ToolbarItem(placement: .principal) {
                Text("Theme")
                    .foregroundColor(.black) // Change the title color here
                    .font(.headline)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}



#Preview {
    ThemeDetail(data : ThemeData(id: 1, name: "theme", category: .objek, description: "some description", xp: 0, status:.complete, image:"", challenges: []))
}
