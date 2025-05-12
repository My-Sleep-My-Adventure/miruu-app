//
//  UserProfile.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 11/05/25.
//

import Foundation

class UserProgress {
    var xp: Int
    var level: Int
    
    init() {
        self.xp = 0
        self.level = 1
    }
    
    func addXP(_ amount: Int) {
        xp += amount
        updateLevelIfNeeded()
    }
    
    private func updateLevelIfNeeded() {
        let newLevel = (xp / 500) + 1
        if newLevel > level {
            level = newLevel
        }
    }
}
