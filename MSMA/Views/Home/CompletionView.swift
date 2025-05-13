//
//  CompletionView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 12/05/25.
//

import SwiftUI

struct CompletionView: View {
    @Binding var themePicked: Bool?
    @Binding var pickedThemeId: Int?
    
    @Binding var showCompletionPopup : Bool
    @Binding var animatePopup : Bool
    
    var selectedTheme: ThemeData?
    
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
            
            VStack {
                if let theme = selectedTheme {
                    Image(theme.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
//                    Text(theme.name)
                    
                    Text("Kamu Berhasil Menyelesaikan Tema!!!")
                        .font(.system(size: 20, design: .rounded))
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color("E0610B"))
                        .padding(.top)
                        .shadow(color: .white.opacity(0.9), radius: 4)
                        .shadow(color: .white.opacity(0.9), radius: 4)
                } else {
                    Text("No Theme Selected")
                }
//                Image(selectedTheme!.image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 200, height: 200)
//                    .scaleEffect(animatePopup ? 1 : 0.5)
//                    .opacity(animatePopup ? 1 : 0)
//                    .animation(.spring(), value: animatePopup)
//                
//                Text(selectedTheme!.name)
//                
//                Text("Theme Completed!")
//                    .font(.title2)
//                    .bold()
//                    .padding(.top)
//                    .foregroundColor(.white)
            }
            .padding()
            .background(Color("FEFCFA").opacity(0.8))
//            .background(Color("FEFCFA"))
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(40)
        }
        .transition(.opacity)

    }
}

//#Preview {
//    CompletionView()
//}
