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
        Text("Mulai petualanganmu dari sebuah tema!")
    }
    
    var message: Text? {
        Text("Ketuk di sini untuk mendapatkan tema. Kamu punya 2 kesempatan setiap hari untuk mengacak ulang.")
    }
}

