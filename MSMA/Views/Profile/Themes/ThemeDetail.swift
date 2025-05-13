//
//  AchievDetail.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

// ThemeDetail.swift
import SwiftUI
import SwiftData

struct ThemeDetail: View {
    @Environment(\.presentationMode) var presentationMode
    @Query var allStories: [Story]
    
    let data: ThemeData
    
    // Initialize with a query to get all stories
    init(data: ThemeData) {
        self.data = data
        // Sort stories by questId to group them logically
        _allStories = Query(sort: [SortDescriptor(\Story.questId)])
    }
    
    // Function to load image from file path
    func loadImage(from path: String) -> Image {
        if let uiImage = UIImage(contentsOfFile: path) {
            return Image(uiImage: uiImage)
        } else {
            // Return a placeholder if image can't be loaded
            return Image(systemName: "photo")
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Image("roller")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    Text(data.name)
                        .font(.title2)
                        .bold()
                    
                    if !allStories.isEmpty {
                        // Group stories by questId
                        ForEach(1...5, id: \.self) { currentQuestId in
                            if let story = allStories.first(where: { $0.questId == currentQuestId }) {
                                VStack(spacing: 12) {
                                    // Display quest number/name
                                    Text("Quest \(currentQuestId)")
                                        .font(.headline)
                                        .padding(.bottom, 4)
                                    
                                    if !story.imagePath.isEmpty {
                                        // Load image from file path
                                        loadImage(from: story.imagePath)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 200, height: 200)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .shadow(radius: 3)
                                    }
                                    
                                    Text(story.storyText)
                                        .font(.body)
                                        .multilineTextAlignment(.center)
                                        .frame(width: 200)
                                    
                                    Divider()
                                        .padding(.vertical, 5)
                                }
                            } else {
                                // Quest exists but no story for it yet
                                VStack {
                                    Text("Quest \(currentQuestId)")
                                        .font(.headline)
                                    
                                    Text("Belum ada cerita untuk quest ini")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .italic()
                                    
                                    Divider()
                                        .padding(.vertical, 5)
                                }
                            }
                        }
                    } else {
                        VStack {
                            Text("Belum ada cerita ...")
                                .font(.title3)
                                .bold()
                                .padding()
                        }
                    }
                }
                .padding()
            }
            .padding()
            .frame(width: 280)
            .frame(maxHeight: 400)
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
                Button(action: {presentationMode.wrappedValue.dismiss()}) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                }
            }
            ToolbarItem(placement: .principal) {
                Text("Cerita Petualangan")
                    .foregroundColor(.black)
                    .font(.headline)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}




//#Preview {
//    ThemeDetail(data : ThemeData(id: 1, name: "theme", category: .objek, description: "some description", xp: 0, status:.complete, image:"", challenges: []))
//}
