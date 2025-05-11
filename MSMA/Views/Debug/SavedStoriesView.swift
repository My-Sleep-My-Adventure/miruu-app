//
//  SavedStoriesView.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 08/05/25.
//

import SwiftUI
import SwiftData

struct SavedStoriesView: View {
    @Query private var stories: [Story]

    var body: some View {
        NavigationStack {
            List {
                ForEach(stories, id: \.self) { story in
                    VStack(alignment: .leading, spacing: 8) {
                        if let uiImage = UIImage(contentsOfFile: story.imagePath) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                                .cornerRadius(12)
                        } else {
                            Text("Gagal memuat gambar")
                                .foregroundColor(.red)
                        }

                        Text(story.storyText)
                            .font(.body)
                            .foregroundColor(.primary)
                            .padding(.top, 4)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Cerita Tersimpan")
        }
    }
}

