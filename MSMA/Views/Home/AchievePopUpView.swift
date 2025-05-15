////
////  AchievePopUpView.swift
////  MSMA
////
////  Created by M Ikhsan Azis Pane on 12/05/25.
////

import SwiftUI

struct AchievePopUpView: View {
    @Binding var showCompletionPopup: Bool
    @Binding var animatePopup: Bool
    
    @State private var rotationAngle: Double = 0

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation {
                        animatePopup = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        showCompletionPopup = false
                    }
                }
            
            VStack(spacing: 20) {
                VStack{
                    Text(Strings.firstAchievementTitle)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color("E0610B"))
                        .shadow(color: .gray.opacity(0.3), radius: 4)
      
                }
                .padding()
                .background(Color("FEFCFA").opacity(0.8))
                .cornerRadius(20)
                
                
                
                Image("achiev1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(rotationAngle))
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.5)) {
                            rotationAngle = 360
                        }
                    }
                
                // Optional Text
//                Text("Achievement Unlocked!")
//                    .font(.title2)
//                    .bold()
//                    .padding(.top)
//                    .foregroundColor(.white)
            }
            .padding()
//            .background(Color("7FC2CA"))
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(40)
        }
        .transition(.opacity)
    }
}
