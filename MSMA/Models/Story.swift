//
//  Story.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 08/05/25.
//

import SwiftUI
import SwiftData

@Model
class Story {
    var id: UUID
    var imagePath: String
    var storyText: String
    var questId: Int // Relationship to quest id
    var createdAt: Date
    
    init(imagePath: String, storyText: String, questId: Int) {
        self.id = UUID()
        self.imagePath = imagePath
        self.storyText = storyText
        self.questId = questId
        self.createdAt = Date()
    }
}
