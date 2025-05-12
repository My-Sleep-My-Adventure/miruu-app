//
//  AchievDetail.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI
import SwiftData

struct ThemeDetail: View {
    @Environment(\.presentationMode) var presentationMode
        
    let data: ThemeData
    
    var body: some View {
        VStack(spacing: 0) {
            Image("roller")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    if let story = data.stories {
                        if !story.imagePath.isEmpty {
                            Text(data.name)
                                .font(.title2)
                                .bold()
                            
                            Image(story.imagePath)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 200)
                            
                            Text(story.storyText)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .frame(width: 200)
                        }
                    } else {
                        VStack {
                            Text("Belum ada cerita ...")
                                .font(.title3)
                                .bold()
                        }
                    }
                }
                .padding()
            }
            .padding()
            .frame(width: 280)
            .frame(maxHeight: 400) // <= ini kuncinya
            .background(.scrollyellow)
            .overlay(Rectangle().stroke(.scrollbrown, lineWidth: 4))
            
            // Bottom Roller
            Image("roller")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 40)
        .background(LinearGradient(gradient: Gradient(colors: [Color("7FC2CA"), Color("FFFFFF")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Cerita Petualangan")
        .foregroundStyle(.black)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {presentationMode.wrappedValue.dismiss()}){
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                }
            }
            ToolbarItem(placement: .principal) {
                Text("Cerita Petualangan")
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
