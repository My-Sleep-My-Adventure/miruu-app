//
//  AchievDetail.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct AchievementDetail: View {
    @Environment(\.presentationMode) var presentationMode
    let data: AchievementData
    
    var body: some View {
        ZStack {
            Color("A5D4DA")
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                Image("cloud3")
            }
            .ignoresSafeArea(.all)
            
            
            VStack() {
                Spacer()
                Text(data.name)
                    .font(.title2)
                    .bold()
                VStack {
                    Image(data.image)
                        .resizable() //
                        .aspectRatio(contentMode: .fill) // Maintains aspect ratio
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                    
                }
                Text(data.description)
                Spacer()
                Spacer()
            }
            .foregroundStyle(.black)
        }
        .navigationBarBackButtonHidden(true)
        .foregroundStyle(.black)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {presentationMode.wrappedValue.dismiss()}){
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                }
            }
            ToolbarItem(placement: .principal) {
                Text("Pencapaian")
                    .foregroundColor(.black) // Change the title color here
                    .font(.headline)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AchievementDetail(data: AchievementData(id: 1, name: "Achiev 1", description: "You Have successfully get achiement 1", image: "", status: false))
}
