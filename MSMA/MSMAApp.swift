//
//  MSMAApp.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

@main
struct MSMAApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(generated: ThemeData(id: 1, name: "", description: "", xp: 1, status: .complete, image: "", challenges: [Challenge(
                category: "Problem Solving",
                name: "Pemilah Pintar",
                image: "pemilah_pintar",
                xp: 20,
                description: "Pisahkan 3 jenis sampah dari rumahmu hari ini, meski sebelumnya belum pernah dilakukan.",
                caution: "Gunakan sarung tangan jika perlu dan cuci tangan setelah memegang sampah."
            )]))
        }
    }
}
