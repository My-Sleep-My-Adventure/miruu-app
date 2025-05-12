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
                Image(selectedTheme!.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .scaleEffect(animatePopup ? 1 : 0.5)
                    .opacity(animatePopup ? 1 : 0)
                    .animation(.spring(), value: animatePopup)
                
                Text("Theme Completed!")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color("7FC2CA"))
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
