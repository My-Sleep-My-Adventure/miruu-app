//
//  AchievementTip.swift
//  Miruu
//
//  Created by Pramuditha Muhammad Ikhwan on 15/05/25.
//

import SwiftUI
import TipKit

struct AchievementTip: Tip {
    var title: Text {
        Text("Pencapaian Baru")
    }
    
    var message: Text? {
        Text("Menyelesaikan quest dan tema akan membuka pencapaian baru, kamu bisa cek di sini")
    }
}
