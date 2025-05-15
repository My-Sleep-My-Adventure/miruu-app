//
//  ShuffleTheme.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 10/05/25.
//

import SwiftUI
import TipKit

struct ShuffleThemeTip: Tip {
    var title: Text {
        Text(Strings.shuffleThemeTipTitle)
    }
    
    var message: Text? {
        Text(Strings.shuffleThemeTipBody)
    }
}


