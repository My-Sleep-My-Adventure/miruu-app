//
//  LevelProgressController.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 12/05/25.
//

import Foundation
import SwiftUI

class LevelProgressController: ObservableObject {
    @Published var currentXP: Int {
        didSet {
            UserDefaults.standard.set(currentXP, forKey: "currentXP")
        }
    }
    
    @Published var currentLevel: Int {
        didSet {
            UserDefaults.standard.set(currentLevel, forKey: "currentLevel")
        }
    }
    
    let maxLevel: Int = 100

    init() {
        self.currentXP = UserDefaults.standard.integer(forKey: "currentXP")
        self.currentLevel = UserDefaults.standard.integer(forKey: "currentLevel")
        
        // Default fallback if first time
        if currentLevel == 0 {
            currentXP = 0
            currentLevel = 1
        }
    }
    
    func xpNeeded(for level: Int) -> Int {
        return level * 500
    }

    func totalXPForLevel(_ level: Int) -> Int {
        var totalXP: Int = 0
        for i in 1..<level {
            totalXP += xpNeeded(for: i)
        }
        return totalXP
    }

    var currentLevelXPProgress: Double {
        if currentLevel >= maxLevel {
            return 1.0
        }
        let xpForCurrentLevel = totalXPForLevel(currentLevel)
        let xpForNextLevel = xpNeeded(for: currentLevel)
        let progressInLevel = Double(currentXP - xpForCurrentLevel)
        return min(progressInLevel / Double(xpForNextLevel), 1.0)
    }

    func addXP(_ amount: Int) {
        let xpAfter = currentXP + amount
        let xpToNextLevel = totalXPForLevel(currentLevel + 1)

        if currentLevel >= maxLevel {
            currentXP = totalXPForLevel(maxLevel)
            return
        }
        
        print("Current Level: \(self.currentLevel), XP: \(xpAfter), XP left to next level: \(xpToNextLevel - xpAfter)")

        if xpAfter < xpToNextLevel || currentLevel == maxLevel {
            withAnimation {
                currentXP = min(xpAfter, totalXPForLevel(maxLevel))
            }
            return
        }

        let xpFillToCurrentLevel = xpToNextLevel
        withAnimation {
            currentXP = xpFillToCurrentLevel
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            if self.currentLevel < self.maxLevel {
                self.currentLevel += 1
            }
            withAnimation {
                self.currentXP = min(xpAfter, self.totalXPForLevel(self.maxLevel))
                
                // Console debugging
                print("===========================================")
                print("Level up! Current Level: \(self.currentLevel)")
                print("Current XP is: \(self.currentXP)")
                print("===========================================")
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.addXP(0)
            }
        }
    }
}
