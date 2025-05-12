//
//  ThemeData.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 11/05/25.
//


import Foundation
import SwiftUI

struct ThemeData {
    enum categories : String {
        case objek
        case tempat
        case orang
    }
    
    enum themeStatus: String {
        case complete
        case incomplete
        case locked
    }
    
    var id : Int
    var name : String
    var category: categories
    var description: String
    var xp: Int
    var status: themeStatus
    var image : String
    var challenges : [Challenge]
    var stories : StoryData?
}

struct Challenge {
    var id: Int
    var category: String
    var name: String
    var image: String // MARK: coba tes jadiin id
    var xp: Int
    var description: String
    var caution: String
    var completed: Bool? = false
}
