//
//  AddImage.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 08/05/25.
//

import SwiftUI

struct AddImage: View {
    var body: some View {
        VStack {
            Image(systemName: "camera.fill")
                .padding(.bottom, 6)
            Text("Tambah Gambar")
        }
        .padding()
        .frame(width: 320, height: 100)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

#Preview {
    AddImage()
}
