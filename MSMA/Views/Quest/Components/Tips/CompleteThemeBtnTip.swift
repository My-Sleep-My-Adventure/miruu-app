//
//  CompleteThemeBtnTip.swift
//  Miruu
//
//  Created by Pramuditha Muhammad Ikhwan on 15/05/25.
//

import SwiftUI
import TipKit

struct CompleteThemeBtnTip: Tip {
    var title: Text {
        Text("Tombol Selesaikan Tema")
    }
        
    var message: Text? {
        Text("Tombol akan aktif setelah kamu berhasil menyelesaikan 5 quest.")
    }
}

