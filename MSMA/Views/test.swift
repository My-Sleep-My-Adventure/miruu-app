//
//  test.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 08/05/25.
//

import SwiftUI

struct test: View {
    var body: some View {
        
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color("7FC2CA"), Color("FFFFFF")]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack {
                Spacer()
                Image("grass")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 399)
                    .ignoresSafeArea(edges: .bottom)
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
            
        }
        .ignoresSafeArea(.all)
    }
}




#Preview {
    test()
}
