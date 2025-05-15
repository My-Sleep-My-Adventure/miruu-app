//
//  QuestTip.swift
//  Miruu
//
//  Created by Pramuditha Muhammad Ikhwan on 15/05/25.
//

import SwiftUI
import TipKit

struct QuestTip: Tip {
    var title: Text {
        Text("Selesaikan Tiap Quest")
    }
        
    var message: Text? {
        Text("Selesaikan tiap quest yang ada untuk mendapatkan XP!")
    }
}
