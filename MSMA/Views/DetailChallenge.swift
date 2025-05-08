//
//  ContentView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct DetailChallengeView: View {
    
    var body: some View {
        NavigationStack {
            Spacer()
            VStack(alignment: .leading) {
                Color.gray
                    .frame(height: 300)
                
            }
            .background(Color.gray)
            .cornerRadius(20)
            .padding()
            
            Spacer()
            VStack(alignment: .leading) {
                Text("Caution!!")
                    
            }
            Spacer()
            VStack(alignment: .leading) {
                
            }
            .frame(maxWidth: 200, maxHeight: 200)
            VStack{
                Text("XP")
                    .bold()
                Text("100")
                    .frame(width: 100, height: 30)
                    .background(Color.gray)
                    .opacity(0.2)
            }
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            VStack {
                
            }
            
            Button {
            } label: {
                Text("Done")
                    .foregroundStyle(Color(.black))
                    .padding(.vertical, 20)
                    .frame(maxWidth: 200)
                    .background(Color.gray)
                    .fontWeight(.bold)
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            Spacer()
            Spacer()
            Spacer()
            

            NavigationView()
        }
        
    }
}

#Preview {
    DetailChallengeView()
}
