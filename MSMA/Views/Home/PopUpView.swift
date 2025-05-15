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
    
    @ObservedObject var questController: QuestController
    
    @EnvironmentObject var navModel: NavigationModel

    @State private var animateAngle = -300.0
    
    let takeThemeTip = TakeThemeTip()

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
                Image(generated?.image ?? Strings.loadDataErrorMsg)
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .scaledToFill()
                
                Text(generated?.name ?? Strings.loadDataErrorMsg)
                    .font(.headline)
                    .bold()
                
                Button {
                    if let _ = generated {
                        // Take theme, update timestamp, and set properties
                        DispatchQueue.main.async {
                            themePicked = true
                            pickedThemeId = generated?.id
                            questController.updateThemeTimestamp()
                        }
                    }
                } label: {
                    Text(Strings.takeThemeBtnMsg)
                        .foregroundStyle(Color("milk"))
                        .padding(.vertical, 20)
                        .frame(maxWidth: 200)
                        .background(.orangePrimary)
                        .fontWeight(.bold)
                        .popoverTip(takeThemeTip)
                }
                .disabled(generated == nil)
                .cornerRadius(6)
                .shadow(radius: generated != nil ? 4 : 0, x: 0, y: generated != nil ? 4 : 0)
            }
            .padding()
            .frame(maxWidth: 350, maxHeight: 410)
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
