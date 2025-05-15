//
//  Beginning.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 10/05/25.
//

import SwiftUI
import TipKit

struct BeginningTip: Tip {
    var title: Text {
        Text(Strings.startAdventureTipTitle)
    }
    
    var message: Text? {
        Text(Strings.startAdventureTipBody)
    }
}

