////
////  ContentView.swift
////  MSMA
////
////  Created by M Ikhsan Azis Pane on 04/05/25.
////

import SwiftUI
import TipKit

struct ShuffleThemeView: View {
//    @EnvironmentObject var navModel: NavigationModel
    @Binding var pickedThemeId: Int?
    @Binding var themePicked: Bool?
    
    @ObservedObject var questController: QuestController
    
    @State private var shuffleCount: Int = 3
    @State private var data = Data()
    @State var generated: ThemeData? = nil
    @State var showPopup = false
    
    @State private var cardRotation: Double = -450
    @State private var cardID = UUID()
    
    let beginningTip = BeginningTip()
    let shuffleTip = ShuffleThemeTip()
    let takeThemeTip = TakeThemeTip()
    
    var body: some View {
        ZStack {
            Image("backgroundImage1")
                .resizable()
                .aspectRatio(contentMode:.fill)
                .ignoresSafeArea()
                .background(.red)
            
            DisplayGif(gifName: "dragonform2", size: 290)
                .offset(y: -40)
                .zIndex(0)
            
            VStack{
                VStack{
                    Spacer()
                    Text("Miruu")
                        .font(.system(size: 65, weight: .bold, design: .rounded))
                        .foregroundStyle(Color("E0610B"))
                        .shadow(color: .white.opacity(0.9), radius: 4)
                        .shadow(color: .white.opacity(0.9), radius: 4)
                        .position(x: 200, y: 30)
                    Spacer()
                }
                
                TipView(beginningTip)
                    .padding()
                
                VStack {
                    if let generated = generated{
                        Text(generated.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(Color("darkBlue"))
                        Text(generated.description)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                }
                .frame(width: 307, height: 70)
                
                VStack {
                    HStack {
                        HStack(spacing: 4) {
                            ForEach(0..<shuffleCount, id: \.self) { _ in
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size: 20))
                                    .opacity(shuffleCount > 0 ? 1 : 0)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .padding(.horizontal, 50)
                    
                    // Buttons section
                    HStack(spacing: 20) {
                        Button {
                            if shuffleCount > 0 {
                                generated = data.generateData()
                                pickedThemeId = generated?.id
                                cardRotation = -90
                                cardID = UUID()
                                showPopup = true
                                shuffleCount -= 1
                            }
                        } label: {
                            Image(systemName: "shuffle")
                                .foregroundStyle(Color("AccentColor"))
                                .frame(maxWidth: 200, maxHeight: 55)
                                .background(Color("milk"))
                                .font(.system(size: 24, weight: .bold))
                        }
                        .cornerRadius(5)
                        .shadow(radius: 4, x: 0, y: 4)
                        .popoverTip(shuffleTip)
                    }
                    .padding(.bottom, 60)
                }
            }
//            .background(.blue)
            .padding(.vertical, 170)
            
            if showPopup {
                PopUpView(
                    isPresented: $showPopup,
                    generated: $generated,
                    navigate: .constant(false),
                    pickedThemeId: $pickedThemeId,
                    themePicked: $themePicked,
                    shuffleCount: $shuffleCount,
                    rotationAngle: cardRotation,
                    cardID: cardID,
                    questController: questController
                )
                .padding(.bottom, 140)
                .zIndex(2)
            }
        }
//        .background(Color.red)
        
        .onAppear {
            // Reset shuffle count when view appears
            if shuffleCount < 3 {
                shuffleCount = 3
            }
            // Ensure theme is properly reset if needed
            questController.checkAndResetThemeIfNeeded()
        }

    }
}


