//
//  TakeTheme.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 11/05/25.
//

import SwiftUI
import TipKit

struct TakeThemeTip: Tip {
    var title: Text {
        Text(Strings.takeThemeTipTitle)
    }
    
    var message: Text? {
        Text(Strings.takeThemeTipBody)
    }
}
