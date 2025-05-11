//
//  PopUpView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 06/05/25.
//

import SwiftUI

struct PopUpView2: View {
    @Binding var isPresented: Bool
    @Binding var generated: ThemeData?
    @Binding var navigate: Bool
    var rotationAngle: Double
    var cardID: UUID

    @State private var animateAngle = -300.0

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
//                Image(generated?.image ?? "Unable to load data")
//                    .resizable()
//                    .frame(maxWidth: 200, maxHeight: 240)
//                    .scaledToFill()
//                
//                Text(generated?.name ?? "Unable to load data")
//                    .font(.headline)
//                    .bold()
                Text("JNCK")

                Button("Selanjutnya") {
                    isPresented = false
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: 120)
                .background(Color("AccentColor"))
                .cornerRadius(10)
            }
            .padding()
            .frame(maxWidth: 350, maxHeight: 400)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.horizontal, 40)
            .rotation3DEffect(.degrees(animateAngle), axis: (x: 0, y: 1, z: 0))
            .onAppear {
                withAnimation(.easeOut(duration: 0.7)) {
                    animateAngle = 0
                }
            }
            .id(cardID)
        }
    }
}
