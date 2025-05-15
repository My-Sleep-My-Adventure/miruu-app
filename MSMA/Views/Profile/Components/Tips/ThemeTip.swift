//
//  ThemeTip.swift
//  Miruu
//
//  Created by Pramuditha Muhammad Ikhwan on 15/05/25.
//

import SwiftUI
import TipKit

struct ThemeTip: Tip {
    var title: Text {
        Text("Kartu Tema")
    }
    
    var message: Text? {
        Text("Setiap selesai menyelesaikan tema, kamu akan mendapatkan kartu tema yang bisa kamu cek di sini nantinya")
    }
}
