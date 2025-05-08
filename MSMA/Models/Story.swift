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
    var createdAt: Date
    
    init(imagePath: String, storyText: String) {
        self.id = UUID()
        self.imagePath = imagePath
        self.storyText = storyText
        self.createdAt = Date()
    }
}
