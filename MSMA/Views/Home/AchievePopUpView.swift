////
////  AchievePopUpView.swift
////  MSMA
////
////  Created by M Ikhsan Azis Pane on 12/05/25.
////
//
//import SwiftUI
//
//struct AchievePopUpView: View {
////    @Binding var themePicked: Bool?
////    @Binding var pickedThemeId: Int?
//    
//    @Binding var showCompletionPopup : Bool
//    @Binding var animatePopup : Bool
//    
//    var body: some View {
//        Image("achiev1")
//            .resizable() //
//            .aspectRatio(contentMode: .fill)
//            .shadow(radius: 4, x: 0, y: 4)
//            .frame(width: 250, height: 250)
//            .clipShape(Circle())
//        
//        ZStack {
//            Color.black.opacity(0.4)
//                .edgesIgnoringSafeArea(.all)
//                .onTapGesture {
//                    withAnimation {
//                        animatePopup = false
//                    }
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                        showCompletionPopup = false
//                    }
//                }
//            
//            VStack {
//                Image("achiev1")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 200, height: 200)
////                    .scaleEffect(animatePopup ? 1 : 0.5)
////                    .opacity(animatePopup ? 1 : 0)
////                    .animation(.spring(), value: animatePopup)
//                
////                Text("Theme Completed!")
////                    .font(.title2)
////                    .bold()
////                    .padding(.top)
////                    .foregroundColor(.white)
//            }
//            .padding()
////            .background(Color("7FC2CA"))
//            .cornerRadius(20)
//            .shadow(radius: 10)
//            .padding(40)
//        }
//        .transition(.opacity)
//
//    }
//}
//
////#Preview {
////    AchievePopUpView()
////}

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
