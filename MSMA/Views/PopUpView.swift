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

    var body: some View {
        VStack(spacing: 20) {
            Text("Generated Theme")
                .font(.title2)
                .bold()

            Text(generated?.name ?? "Unable to load data")
                .font(.headline)

            Section{
                Button {
                    isPresented = false
                } label: {
                    Text("Next")
                        .foregroundStyle(Color("milk"))
                        .padding(.vertical, 20)
                        .frame(maxWidth: 200)
                        .background(Color("purple"))
                        .fontWeight(.bold)
                        
                }
                .clipShape(RoundedRectangle(cornerRadius: 7))
            }.padding()
        }
        .padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                isPresented = false
                // Add small delay to allow sheet to fully dismiss before navigating
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                    navigate = true
                }
            }
        }
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                isPresented = false
//                navigate = true
//            }
//        }
    }
}

//#Preview {
//    PopUpView(generated: ThemeData(id: 1, name: "Adventure", description: "Explore something new today!", caution: "", xp: 100, status: "active", image: "")
//    )
////    return PopUpView(generated: $sample)
//}
