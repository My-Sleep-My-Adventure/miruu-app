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
    
    // Modified query with predicate to filter stories by theme
    @Query var allStories: [Story]
    
    let data: ThemeData
    
    // Initialize with a query filtered by questIds related to this theme
    init(data: ThemeData) {
        self.data = data
        
        // Create an array of quest IDs from this specific theme
        let questIds = data.challenges.map { $0.id }
        
        // Filter stories where the questId is in our list of theme-specific questIds
        _allStories = Query(filter: #Predicate<Story> { story in
            questIds.contains(story.questId)
        }, sort: [SortDescriptor(\Story.questId)])
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
    
    var date: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium   // or .short, .long
        formatter.timeStyle = .none     // omit time if not needed
        return formatter.string(from: Date())
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                VStack(spacing: 8) {
                    Text(Strings.adventureJournalMsg)
                        .font(.title2)
                        .bold()

                    Text(data.name)
                        .font(.title2)
                        .bold()
                    
                    Image("smileactive")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("Kamu berhasil nyelesaiin tema ini pada tanggal \(date)")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding()

                VStack(alignment: .leading, spacing: 16) {
                    Text(Strings.themeDetailHeadingMsg)
                        .font(.headline)
                        .padding(.bottom, 5)

                    if !allStories.isEmpty {
                        ForEach(allStories, id: \.self) { story in
                            HStack(alignment: .top, spacing: 12) {
                                if !story.imagePath.isEmpty {
                                    loadImage(from: story.imagePath)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 120, height: 170)
                                        .clipped()
                                        .cornerRadius(12)
                                }

                                Text(story.storyText)
                                    .font(.body)
                                    .multilineTextAlignment(.leading)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(radius: 2)
                        }
                    } else {
                        Text("Belum ada cerita ...")
                            .font(.title3)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                }
            }
            .padding()
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color("7FC2CA"), .white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
        )
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Cerita Petualangan")
        .foregroundStyle(.black)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
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




#Preview {
    ThemeDetail(data : ThemeData(id: 1, name: "theme", category: .objek, description: "some description", xp: 0, status:.complete, image:"", challenges: []))
}
