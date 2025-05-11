//
//  ContentView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI
import TipKit

struct ShuffleThemeView: View {
    @EnvironmentObject var navModel: NavigationModel
    @Binding var pickedThemeId: Int?
    @Binding var themePicked: Bool?
    
    @State private var shuffleCount: Int = 3
    @State private var data = Data()
    @State var generated: ThemeData? = nil
//    @State private var activeTheme = false
//    @State var navigate = false
    @State var showPopup = false
    
    @State private var cardRotation: Double = -450
    @State private var cardID = UUID()
    
    let beginningTip = BeginningTip()
    let shuffleTip = ShuffleThemeTip()
    
    var body: some View {
        ZStack {
            Image("backgroundImage1")
                .resizable()
                .aspectRatio(contentMode:.fill)
                .ignoresSafeArea(edges: .all)
            
            DisplayGif(gifName: "dragonform2", size: 290)
                .offset(y: -40)
                .zIndex(0)
            
            VStack{
                TipView(beginningTip)
                    .padding()
                
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
                //                    .padding(.bottom, 47)
                VStack {
                    HStack {
                        HStack(spacing: 4) {
                            ForEach(0..<shuffleCount, id: \.self) { _ in
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size: 20))
                            }
                        }
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
                                .frame(width: 65,height: 55)
                                .background(Color("milk"))
                                .font(.system(size: 24, weight: .bold))
                        }
                        .cornerRadius(5)
                        .shadow(radius: 4, x: 0, y: 4)
                        
                        Button {
                            if let _ = generated {
                                // Update properties in single operation
                                DispatchQueue.main.async {
                                    themePicked = true
                                    pickedThemeId = generated?.id
                                }
                            }
                        } label: {
                            Text("Ambil Tema")
                                .foregroundStyle(Color(generated != nil ? "milk" : "foregroundGrey"))
                                .padding(.vertical, 20)
                                .frame(maxWidth: 200)
                                .background(Color(generated != nil ? "AccentColor" : "backgroundGrey"))
                                .fontWeight(.bold)
                        }
                        .disabled(generated == nil)
                        .cornerRadius(6)
                        .shadow(radius: generated != nil ? 4 : 0, x: 0, y: generated != nil ? 4 : 0)
                        .popoverTip(shuffleTip)
                    }
                    .padding(.bottom, 60)
                }
            }
            .padding(.vertical, 170)
            
            if showPopup {
                PopUpView(
                    isPresented: $showPopup,
                    generated: $generated,
                    navigate: .constant(false), // Removed navigation
                    rotationAngle: cardRotation,
                    cardID: cardID
                )
                .zIndex(2)
            }
        }
    }
}


