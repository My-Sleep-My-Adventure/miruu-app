//
//  DisplayGif.swift
//  LearnObject
//
//  Created by M Zaidaan Nugroho on 06/05/25.
//

import SwiftUI

struct DisplayGif: View {
    
    var gifName: String
    var size: CGFloat
    
    @State private var gifImage: Image?
    
    var body: some View {
        let asset = NSDataAsset(name: "\(gifName)")
        VStack {
            if let gifImage {
                gifImage
                    .resizable()
                    .scaledToFill()
            } else {
                Text("Oops!")
                    .foregroundStyle(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(.black))
                
            }
        }
        .padding()
        .onAppear {
            if let asset {
                let gifData = asset.data as CFData
                CGAnimateImageDataWithBlock(gifData, nil) { index, cgImage, stop in
                    self.gifImage = Image(uiImage: .init(cgImage: cgImage))
                }
            }
        }
        .frame(maxWidth: size, maxHeight: size, alignment: .center)

    }
}

