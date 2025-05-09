//
//  LevelProgress.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 07/05/25.
//

import SwiftUI

struct LevelProgress: View {
    @State private var currentXP: Int = 200
    @State private var currentLevel: Int = 1
    
    let maxLevel: Int = 10
    
    // Function to handle XP needed from level X to X+1
    func xpNeeded(for level: Int) -> Int {
        return level * 500
    }
    
    // Function to calculate total XP needed to some level X
    func totalXPForLevel(_ level: Int) -> Int {
        var totalXP: Int = 0
        for i in 1..<level {
            totalXP += xpNeeded(for: i)
        }
        return totalXP
    }
    
    // Function to calculate progress in current level
    var currentLevelXPProgress: Double {
        if currentLevel >= maxLevel {
            return 1.0
        }
        
        let xpForCurrentLevel = totalXPForLevel(currentLevel)
        let xpForNextLevel = xpNeeded(for: currentLevel)
        let progressInLevel = Double(currentXP - xpForCurrentLevel)
        return min(progressInLevel / Double(xpForNextLevel), 1.0)
    }
    
    var body: some View {
        VStack {
            ZStack {
                
                // Circle background
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 16)
                
                // Circle progress
                Circle()
                    .trim(from: 0, to: currentLevelXPProgress)
                    .stroke(Gradient(colors: [.green, .yellow, .green]), style: StrokeStyle(lineWidth: 16, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 0.5), value: currentLevelXPProgress)
                
                // Character Image
                Image("drago")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .position(x: 60, y: 70)
                
                if currentLevel >= maxLevel {
                    Text("Max Level!")
                        .font(.headline)
                        .bold()
                        .foregroundStyle(.white)
                        .frame(width: 100, height: 30)
                        .background(Gradient(colors: [.orange, .yellow]))
                        .cornerRadius(20)
                        .position(x: 60, y: 114)
                } else {
                    Text("Level \(currentLevel)")
                        .font(.headline)
                        .bold()
                        .foregroundStyle(.white)
                        .frame(width: 100, height: 30)
                        .background(Gradient(colors: [.orange, .yellow]))
                        .cornerRadius(20)
                        .position(x: 60, y: 114)
                }
            }
            .frame(width: 120, height: 120)
            .padding(.top)
//            .padding()
            
//            Button {
//                addXP(100)
//            } label: {
//                HStack {
//                    Image(systemName: "plus")
//                    Text("Add 100 XP")
//                }
//            }
//            .padding(.top, 20)
        }
    }
    
    // Mock function to test add XP
    func addXP(_ amount: Int) {
//        let xpBefore = currentXP
        let xpAfter = currentXP + amount
        let xpToNextLevel = totalXPForLevel(currentLevel + 1)
        
        // Limit XP in max level. Stopping XP to increase when it reached max level.
        if currentLevel >= maxLevel {
            currentXP = totalXPForLevel(maxLevel)
            return
        }
        
        // Console debugging
        print("Current Level: \(currentLevel), XP: \(xpAfter), XP left to next level: \(xpToNextLevel - xpAfter)")
        
        // If the new XP not enough to level up, then just animate the circle. Also, when the level is max, don't process level up animation.
        if xpAfter < xpToNextLevel || currentLevel == maxLevel {
            withAnimation {
                currentXP = min(xpAfter, totalXPForLevel(maxLevel))
            }
            return
        }
        
        // If the XP is enough to level up, then process level up animation.
        let xpFillToCurrentLevel = xpToNextLevel
        
        withAnimation {
            currentXP = xpFillToCurrentLevel // Update current XP is in the same value as XP needed to complete current level.
        }
        
        // Delay the animation for 0.6 second to fill the circle until 1.0 (100%) then process the next level.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            if currentLevel < maxLevel {
                currentLevel += 1
            }
            withAnimation {
                currentXP = min(xpAfter, totalXPForLevel(maxLevel))
                
                // Console debugging
                print("===========================================")
                print("Level up! Current Level: \(currentLevel)")
                print("Current XP is: \(currentXP)")
                print("===========================================")
            }
            
            // Handler if the user gets bunch of XPs at one time.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                // Recursive to handle many level up at one time.
                addXP(0)
            }
        }
    }
}

#Preview {
    LevelProgress()
}
