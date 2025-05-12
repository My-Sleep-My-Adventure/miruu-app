//
//  AchievementData.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 11/05/25.
//


import Foundation
import SwiftUI

struct AchievementData {
    var id : Int
    var name : String
    var description : String
    var image : String
    var status : Bool
}

struct StoryData {
    var id: UUID = UUID()
    var imagePath: String
    var storyText: String
    var createdAt: Date = Date()
}
