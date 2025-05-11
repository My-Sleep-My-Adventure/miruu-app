//
//  PopUpView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 06/05/25.
//

import SwiftUI

struct PopUpView: View {
    @Binding var isPresented: Bool
    @Binding var generated: ThemeData?
    @Binding var navigate: Bool
    @Binding var pickedThemeId: Int?
    @Binding var themePicked: Bool?
    @Binding var shuffleCount: Int
    var rotationAngle: Double
    var cardID: UUID
    
    @EnvironmentObject var navModel: NavigationModel

    @State private var animateAngle = -300.0

    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    if shuffleCount > 0 {
                        navigate = true
                        isPresented = false
                    }
                }
            
            VStack(spacing: 20) {
                Image(generated?.image ?? "Unable to load data")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 240)
                    .scaledToFill()
                
                Text(generated?.name ?? "Unable to load data")
                    .font(.headline)
                    .bold()

//                Button("Selanjutnya") {
//                    isPresented = false
//                }
//                .foregroundColor(.white)
//                .padding()
//                .frame(maxWidth: 120)
//                .background(Color("AccentColor"))
//                .cornerRadius(10)
                
                Button {
//                    if activeTheme {}
                    themePicked = true
                    pickedThemeId = generated?.id
//                    navModel.path.append(Route.main)
//                    navModel.currentRoute = .profile
//                    isPresented = false
                } label: {
                    Text("Ambil Tema")
                        .foregroundStyle(Color("milk"))
                        .padding(.vertical, 20)
                        .frame(maxWidth: 200)
                        .background(Color( "AccentColor"))
                        .fontWeight(.bold)
                }
//                .disabled(!activeTheme)
                .cornerRadius(6)
//                .shadow(radius: activeTheme ? 4 : 0, x: 0, y: activeTheme ? 4 : 0)
//                .disabled(!activeTheme)
                .cornerRadius(6)
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
