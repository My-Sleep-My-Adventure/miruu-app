//
//  ContentView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//
import SwiftUI

struct QuestView: View {
    @EnvironmentObject var navModel: NavigationModel
    @EnvironmentObject var questController: QuestController
    @Environment(\.dismiss) var dismiss
    @Binding var themePicked: Bool?
    @Binding var pickedThemeId: Int?
    
    var selectedTheme: ThemeData? {
        guard let id = pickedThemeId else { return nil }
        return data.listDataTheme.first { $0.id == id }
    }

    @State var data = Data()
    
    // State binding for key learning sheet
    @State private var isKeyLearningSheetPresented: Bool = false
    
    // State binding for keyLearningViewModel
    @StateObject var keyLearningViewModel = KeyLearningModel()
    
    // Timer to check for theme expiration while the view is active
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color("7FC2CA"), Color("FFFFFF")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                    if let selectedTheme = selectedTheme {
                        VStack {
                            ZStack {
                                Image("cloud")
                                Button{
                                    questController.resetTheme()
                                    navModel.path = NavigationPath()
                                    navModel.path.append(Route.home)
                                } label: {
                                    Text("reset")
                                }
                                VStack {
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text(selectedTheme.name)
                                                .font(.title)
                                                .fontDesign(.rounded)
                                                .bold()
                                            
                                            Text(questController.formattedTimeRemaining)
                                                .font(.subheadline)
                                                .foregroundColor(.black)
                                        }
                                        .padding()
                                        
                                        Spacer()
                                        
                                        DisplayGif(gifName: "dragonform2", size: 160)
                                            .frame(maxWidth: 160, maxHeight: 160)
                                    }
                                    .padding()
                                }
                            }
                            
                            VStack(spacing: 15) {
                                ForEach(0..<5) { index in
                                    QuestRow(challenge: selectedTheme.challenges[index], index: index, isCompleted: selectedTheme.challenges[index].completed ?? false)
                                }
                            }
                            .padding(.horizontal)
                            
                            Spacer()
                            
                            Button {
                                isKeyLearningSheetPresented.toggle()
                            } label: {
                                Text("Selesaikan Tema")
                                    .foregroundStyle(Color("milk"))
                                    .frame(maxWidth: 323, maxHeight: 50)
                                    .padding(.vertical, 20)
                                    .background(Color("E0610B"))
                                    .fontWeight(.bold)
                            }
                            .cornerRadius(20)
                            .shadow(radius: 4, y: 4)
                            .sheet(isPresented: $isKeyLearningSheetPresented) {
                                EditableRectangularImageDocumentation(viewModel: keyLearningViewModel)
                            }
                            .padding(.top, 20)
                            .padding(.bottom, 80)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .onReceive(timer) { _ in
                questController.checkAndResetThemeIfNeeded()
                if questController.themePicked == nil || questController.themePicked == false {
                    // Theme has been reset by the timer, navigate back
                    navModel.path = NavigationPath()
                    navModel.path.append(Route.home)
                }
            }
            .onAppear {
                // Check if theme should be reset immediately when view appears
                questController.checkAndResetThemeIfNeeded()
            }
        }
    }
}


