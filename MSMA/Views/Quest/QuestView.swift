//
//  ContentView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//
import SwiftUI
import SwiftData
import TipKit

struct QuestView: View {
    @EnvironmentObject var navModel: NavigationModel
    @EnvironmentObject var questController: QuestController
    @Environment(\.dismiss) var dismiss
    @Binding var themePicked: Bool?
    @Binding var pickedThemeId: Int?
    @State private var showCompletionPopup = false
    @State private var animatePopup = false
    
    @State private var showAchievementPopup = false
    
    var selectedTheme: ThemeData? {
        guard let id = pickedThemeId else { return nil }
        return data.listDataTheme.first { $0.id == id }
    }
    
    @AppStorage("hasShownAchievementPopup") private var hasShownAchievementPopup = false
    
    // Env object container for levelController passing
    @EnvironmentObject var levelController: LevelProgressController
    
    //    @State var data = Data()
    @EnvironmentObject var data : Data
    
    // State binding for key learning sheet
    @State private var isThemeStoryViewPresented: Bool = false
    
    // State binding for keyLearningViewModel
    @StateObject var keyLearningViewModel = KeyLearningModel()
    
    // Timer to check for theme expiration while the view is active
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    // Query of stories to check if the quest is completed
    @Query var stories: [Story] // Get all stories from SwiftData
    
    // Check if the quest is completed where the user already log the story
    var completedQuestIds: [UUID] {
        stories.map { $0.questId }
    }
    
    // Condition checking to check current theme quest id
    var completedQuestIdsForCurrentTheme: [UUID] {
        guard let currentTheme = selectedTheme else { return [] }
        
        let currentThemeQuestIds = currentTheme.challenges.map { $0.id }
        
        return stories
            .filter { currentThemeQuestIds.contains($0.questId) }
            .map { $0.questId }
    }
    
    // Condition checking to disabled the "Selesaikan Tema" button
    var isCompletedQuestEmpty: Bool {
        completedQuestIdsForCurrentTheme.count < 5
    }
    
    let questTip = QuestTip()
    let completeThemeBtnTip = CompleteThemeBtnTip()

    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color("7FC2CA"), Color("FFFFFF")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                    if let selectedTheme = selectedTheme {
                        VStack {
                            ZStack {
                                Image("cloud")
//                                Button{
//                                    questController.resetTheme()
//                                    navModel.path = NavigationPath()
//                                    navModel.path.append(Route.home)
//                                } label: {
//                                    Text("reset")
//                                }
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
                                        
                                        DisplayGif(gifName: levelController.currentDragonForm, size: 200)
                                            .id(levelController.currentDragonForm)
                                            .frame(maxWidth: 160, maxHeight: 160)
                                    }
                                    .padding()
                                }
                            }
                            
                            VStack(spacing: 15) {
                                ForEach(Array(selectedTheme.challenges.enumerated()), id: \.element.id) { index, challenge in
                                    QuestRow(
                                        challenge: challenge,
                                        index: index,pickedThemeId: pickedThemeId!,
                                        completedQuestsIds: completedQuestIds
                                    )
                                    .environmentObject(levelController)
                                }
                            }
                            .popoverTip(questTip)
                            .padding(.horizontal)
                            
                            Spacer()
                            
                            Button {
                                if let pickedId = pickedThemeId,
                                   let index = data.listDataTheme.firstIndex(where: { $0.id == pickedId }) {
                                    data.listDataTheme[index].status = .complete
                                }
                                isThemeStoryViewPresented.toggle()
                            } label: {
                                Text(Strings.completeThemeBtnMsg)
                                    .foregroundStyle(Color("milk"))
                                    .frame(maxWidth: 323, maxHeight: 50)
                                    .padding(.vertical, 20)
                                    .background(isCompletedQuestEmpty ? Color.gray.opacity(0.6) : Color("E0610B"))
                                    .font(.body)
                                    .fontWeight(.bold)
                            }
                            .disabled(isCompletedQuestEmpty)
                            .popoverTip(completeThemeBtnTip)
                            .cornerRadius(20)
                            .shadow(radius: 4, y: 4)
                            .sheet(isPresented: $isThemeStoryViewPresented) {
                                ThemeStoryView(
                                    onCompletion: {
                                        showCompletionPopup = true
                                        themePicked = true

                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                                showCompletionPopup = false

                                                if !hasShownAchievementPopup {
                                                    showAchievementPopup = true
                                                    animatePopup = true
                                                    hasShownAchievementPopup = true
                                                }

                                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                                    showAchievementPopup = false
                                                    animatePopup = false
                                                    navModel.currentTab = .profile
                                                    themePicked = false
                                                }
                                            }
                                        }
                                    }
                                )
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium])
                            }
                            .padding(.top, 20)
                            .padding(.bottom, 80)
                        }
                    }
                }
            }
            .overlay(
                Group {
                    if showCompletionPopup, let theme = selectedTheme {
                        CompletionView(
                            themePicked: $themePicked,
                            pickedThemeId: $pickedThemeId,
                            showCompletionPopup: $showCompletionPopup,
                            animatePopup: $animatePopup,
                            selectedTheme: theme
                        )
                    } else if showAchievementPopup {
                        AchievePopUpView(
                            showCompletionPopup: $showAchievementPopup,
                            animatePopup: $animatePopup
                        )
                    }
                }
            )
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


