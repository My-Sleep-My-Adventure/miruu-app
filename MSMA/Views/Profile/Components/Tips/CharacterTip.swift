//
//  CharacterTip.swift
//  Miruu
//
//  Created by Pramuditha Muhammad Ikhwan on 15/05/25.
//

import SwiftUI
import TipKit

struct CharacterTip: Tip {
    var title: Text {
        Text("Ini Karakter Kamu")
    }
    
    var message: Text? {
        Text("Selesaikan banyak quest untuk mendapatkan XP dan meningkatkan level karakter!")
    }
    
    var image: Image? {
        Image(systemName: "arrowshape.up.circle.fill")
    }
}
