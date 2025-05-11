//
//  QuestDetailView.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 10/05/25.
//

import SwiftUI

struct QuestDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var challenge: Challenge

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack(alignment: .bottom) {
                    // Background gradient
                    VStack{
                        LinearGradient(gradient: Gradient(colors: [Color("7FC2CA"), Color("FFFFFF")]),
                                       startPoint: .top,
                                       endPoint: .bottom
                        )

                        // Grass at bottom
                        Image("grass")
                            .resizable()
                            .frame(width: geometry.size.width, height: 218)
//                            .position(x: geometry.size.width / 2, y: geometry.size.height - 50)
                            .background(Color.red)
                    }
                    .ignoresSafeArea()

                        
                    
                    VStack(spacing: 20) {
                        // Spacer for top padding
                        Spacer().frame(height: geometry.size.height * 0.08)
                        
                        // Mission Panel
                        VStack(alignment: .leading, spacing: 16) {
                            HStack(alignment: .top) {
                                Image(systemName: "cardicon1")
                                    .padding(.top, 4)
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(challenge.name)
                                        .font(.headline)
                                        .bold()
                                    //                                    Text("Meet an online driver )
                                    //                                        .font(.subheadline)
                                    //                                        .underline()
                                    //                                        .foregroundColor(.brown)
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Deskripsi misi:")
                                    .fontWeight(.bold)
                                Text(challenge.description)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Perhatian: ")
                                    .fontWeight(.bold)
                                Text(challenge.caution)
                                //                                ForEach(0..<4, id: \.self) { _ in
                                //                                    Text("- Lorem ipsum dolor dolor dolor")
                                //                                }
                            }
                            
                            VStack(alignment: .center, spacing: 4) {
                                Text("Hadiah:")
                                    .fontWeight(.bold)
                                Text("\(challenge.xp)")
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 12)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(6)
                            }
                        }
                        .padding()
                        .background(Color("milk"))
                        .cornerRadius(24)
                        .padding(.horizontal, 20)
                        
                        Spacer()
                    }
                    
                    // Button fixed above grass
                    Button(action: {
                        // Action here
//                        if let pickedId = pickedThemeId,
//                           let index = data.listDataTheme.firstIndex(where: { $0.id == pickedId }) {
//                            data.listDataTheme[index].status = .complete
//                        }
//                        challenge.
                        
                        
                    }) {
                        Text("Tandai selesai")
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                            .bold()
                            .frame(width: 200)
                            .background(Color("AccentColor"))
                            .cornerRadius(18)
                            .shadow(radius: 4)
                    }
                    .padding(.bottom, geometry.safeAreaInsets.bottom + 32)
                }
                .navigationBarBackButtonHidden(true)
                .navigationTitle("Achievement")
                .foregroundStyle(.black)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {presentationMode.wrappedValue.dismiss()}){
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.black)
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Detail Tantangan")
                            .foregroundColor(.black) // Change the title color here
                            .font(.headline)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//#Preview {
//    QuestDetailView()
//}
