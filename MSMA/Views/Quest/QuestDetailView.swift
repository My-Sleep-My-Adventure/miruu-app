//
//  QuestDetailView.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 10/05/25.
//

import SwiftUI

struct QuestDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    // State binding for key learning sheet
    @State private var isKeyLearningSheetPresented: Bool = false
    
    // State binding for keyLearningViewModel
    @StateObject var keyLearningViewModel = KeyLearningModel()
    
    //State binding for levelController
    @StateObject var levelController = LevelProgressController()
    
    // Challenge/Quest object
    var challenge: Challenge
    
    // Identifier for this quest
    let questId: Int
    
    // Quest complete identifier
    let isCompleted: Bool

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
                            .background(Color.red)
                    }
                    .ignoresSafeArea()

                        
                    
                    VStack(spacing: 20) {
                        // Spacer for top padding
                        Spacer().frame(height: geometry.size.height * 0.08)
                        
                        
                        // Mission Panel
                        VStack(alignment: .leading, spacing: 16) {
                            
                            if isCompleted {
                                VStack(alignment: .leading) {
                                    Text("Kamu sudah menyelesaikan challenge ini!")
                                        .font(.subheadline)
                                        .multilineTextAlignment(.center)
                                        .fontWeight(.semibold)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.all, 6)
                                .foregroundStyle(.white)
                                .background(Color.success)
                                .cornerRadius(9)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(challenge.name)
                                    .font(.title2)
                                    .bold()
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Deskripsi misi:")
                                    .fontWeight(.semibold)
                                Text(challenge.description)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Perhatian: ")
                                    .fontWeight(.semibold)
                                Text(challenge.caution)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Hadiah:")
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 4)
                                HStack {
                                    Image(systemName: "trophy.fill")
                                    Text("\(challenge.xp) XP")
                                        .fontWeight(.semibold)
                                }
                                .padding(.all, 4)
                                .background(Color.success)
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
                    
                    // MARK: Fix this button size
                    // Button fixed above grass
                    if !isCompleted {
                        Button(action: {
                            isKeyLearningSheetPresented.toggle()
                        }) {
                            Text("Tuntaskan Misi")
                                .foregroundColor(.white)
                                .frame(maxWidth: 323, maxHeight: 50)
                                .padding(.vertical, 5)
                                .bold()
                                .background(Color("AccentColor"))
                        }
                        .cornerRadius(20)
                        .shadow(radius: 4)
                        .padding(.bottom, geometry.safeAreaInsets.bottom + 32)
                        .sheet(isPresented: $isKeyLearningSheetPresented) {
                            EditableRectangularImageDocumentation(viewModel: keyLearningViewModel, questId: questId)
                                .presentationDragIndicator(.visible)
                                .environmentObject(levelController)
                        }
                    }
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
