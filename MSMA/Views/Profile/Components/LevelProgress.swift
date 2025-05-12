//
//  LevelProgress.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 07/05/25.
//

import SwiftUI

struct LevelProgress: View {
    @ObservedObject var levelController: LevelProgressController

    var body: some View {
        VStack {
            ZStack {
                
                // Circle background
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 16)
                
                // Circle progress
                Circle()
                    .trim(from: 0, to: levelController.currentLevelXPProgress)
                    .stroke(Gradient(colors: [.green, .yellow, .green]), style: StrokeStyle(lineWidth: 16, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 0.5), value: levelController.currentLevelXPProgress)
                
                // Character Image
                Image("drago")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .position(x: 60, y: 70)
                
                if levelController.currentLevel >= levelController.maxLevel {
                    Text("Max Level!")
                        .font(.headline)
                        .bold()
                        .foregroundStyle(.white)
                        .frame(width: 100, height: 30)
                        .background(Gradient(colors: [.orange, .yellow]))
                        .cornerRadius(20)
                        .position(x: 60, y: 114)
                } else {
                    Text("Level \(levelController.currentLevel)")
                        .font(.system(size: 17, weight: .bold, design: .rounded))
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
            
            Text("\(levelController.currentXP - levelController.totalXPForLevel(levelController.currentLevel)) / \(levelController.xpNeeded(for: levelController.currentLevel)) XP")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.darkBlue)
                            .padding(.top, 8)

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
//    
//    // Mock function to test add XP
//    func addXP(_ amount: Int) {
////        let xpBefore = currentXP
//        let xpAfter = currentXP + amount
//        let xpToNextLevel = totalXPForLevel(currentLevel + 1)
//        
//        // Limit XP in max level. Stopping XP to increase when it reached max level.
//        if currentLevel >= maxLevel {
//            currentXP = totalXPForLevel(maxLevel)
//            return
//        }
//        
//        // Console debugging
//        print("Current Level: \(currentLevel), XP: \(xpAfter), XP left to next level: \(xpToNextLevel - xpAfter)")
//        
//        // If the new XP not enough to level up, then just animate the circle. Also, when the level is max, don't process level up animation.
//        if xpAfter < xpToNextLevel || currentLevel == maxLevel {
//            withAnimation {
//                currentXP = min(xpAfter, totalXPForLevel(maxLevel))
//            }
//            return
//        }
//        
//        // If the XP is enough to level up, then process level up animation.
//        let xpFillToCurrentLevel = xpToNextLevel
//        
//        withAnimation {
//            currentXP = xpFillToCurrentLevel // Update current XP is in the same value as XP needed to complete current level.
//        }
//        
//        // Delay the animation for 0.6 second to fill the circle until 1.0 (100%) then process the next level.
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
//            if currentLevel < maxLevel {
//                currentLevel += 1
//            }
//            withAnimation {
//                currentXP = min(xpAfter, totalXPForLevel(maxLevel))
//                
//                // Console debugging
//                print("===========================================")
//                print("Level up! Current Level: \(currentLevel)")
//                print("Current XP is: \(currentXP)")
//                print("===========================================")
//            }
//            
//            // Handler if the user gets bunch of XPs at one time.
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
//                // Recursive to handle many level up at one time.
//                addXP(0)
//            }
//        }
//    }
}
//
//#Preview {
//    Level
//}
