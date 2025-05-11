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
        Text("Ambil Tema")
    }
    
    var message: Text? {
        Text("Ketuk di sini untuk mengambil tema yang kamu mau. Kamu hanya dapat mengambil tema sekali dalam 24 jam.")
    }
}
