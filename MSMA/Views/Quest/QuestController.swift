//
//  QuestChangesController.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 11/05/25.
//

import SwiftUI

class QuestController: ObservableObject {
    @Published var timeRemaining: TimeInterval = 86400 // 24 hours
    @Published var formattedTimeRemaining: String = "24h 00m 00s" // For UI display with seconds

    private var timer: Timer?
    
    @AppStorage("pickedThemeId") var pickedThemeId: Int?
    @AppStorage("themePicked") var themePicked: Bool?
    @AppStorage("themeTimestamp") var themeTimestamp: Double = 0
    
    init() {
        checkAndResetThemeIfNeeded()
        if themePicked == true && themeTimestamp > 0 {
            startCountdownFromSavedTime()
        }
    }
    
    func checkAndResetThemeIfNeeded() {
        let now = Date().timeIntervalSince1970
        
        if themeTimestamp > 0 {
            let elapsed = now - themeTimestamp
            let remaining = max(86400 - elapsed, 0)
            
            if remaining <= 0 {
                resetTheme()
            } else {
                // Update the time remaining based on elapsed time
                timeRemaining = remaining
                updateFormattedTime()
            }
        }
    }
    
    func resetTheme() {
        pickedThemeId = nil
        themePicked = nil
        themeTimestamp = 0
        timeRemaining = 86400
        updateFormattedTime()
        timer?.invalidate()
        timer = nil
    }
    
    func updateThemeTimestamp() {
        themeTimestamp = Date().timeIntervalSince1970
        startCountdownFromSavedTime()
    }
    
    // Countdown based on saved timestamp
    func startCountdownFromSavedTime() {
        let now = Date().timeIntervalSince1970
        let elapsed = now - themeTimestamp
        timeRemaining = max(86400 - elapsed, 0)
        updateFormattedTime()
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            self.timeRemaining = max(self.timeRemaining - 1, 0)
            self.updateFormattedTime()
            
            if self.timeRemaining <= 0 {
                self.timer?.invalidate()
                self.timer = nil
                self.countdownDidFinish()
            }
        }
    }
    
//    private func updateFormattedTime() {
//        let hours = Int(timeRemaining) / 3600
//        let minutes = Int(timeRemaining) % 3600 / 60
//        formattedTimeRemaining = "\(hours)h \(String(format: "%02d", minutes))m"
//    }
    
    private func updateFormattedTime() {
        let hours = Int(timeRemaining) / 3600
        let minutes = Int(timeRemaining) % 3600 / 60
        let seconds = Int(timeRemaining) % 60
        formattedTimeRemaining = "\(hours)h \(String(format: "%02d", minutes))m \(String(format: "%02d", seconds))s"
    }
        
    func countdownDidFinish() {
        print("Countdown finished. Resetting theme.")
        resetTheme()
    }
    
    deinit {
        timer?.invalidate()
    }
}
