////
////  ContentView.swift
////  MSMA
////
////  Created by M Ikhsan Azis Pane on 04/05/25.
////
//
//import SwiftUI
//import TipKit
//
//struct ShuffleThemeView: View {
//    @EnvironmentObject var navModel: NavigationModel
//    @Binding var pickedThemeId: Int?
//    @Binding var themePicked: Bool?
//
//    @State private var shuffleCount: Int = 3
//    @State private var data = Data()
//    @State var generated: ThemeData? = nil
//        @State private var activeTheme = false
//        @State var navigate = false
//    @State var showPopup = false
//
//    @State private var cardRotation: Double = -450
//    @State private var cardID = UUID()
//
//    let beginningTip = BeginningTip()
//    let shuffleTip = ShuffleThemeTip()
//
//    var body: some View {
//        ZStack {
//            Image("backgroundImage1")
//                .resizable()
//                .aspectRatio(contentMode:.fill)
//                .ignoresSafeArea(edges: .all)
//
//            DisplayGif(gifName: "dragonform2", size: 290)
//                .offset(y: -40)
//                .zIndex(0)
//
//            VStack{
//                TipView(beginningTip)
//                    .padding()
//
//                VStack{
//                    Spacer()
//                    Text("Miruu")
//                        .font(.system(size: 65, weight: .bold, design: .rounded))
//                        .foregroundStyle(Color("E0610B"))
//                        .shadow(color: .white.opacity(0.9), radius: 4)
//                        .shadow(color: .white.opacity(0.9), radius: 4)
//                        .position(x: 200, y: 30)
//                    Spacer()
//                }
//
//                VStack {
//                    if let generated = generated{
//                        Text(generated.name)
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .foregroundStyle(Color("darkBlue"))
//                        Text(generated.description)
//                            .font(.caption)
//                            .multilineTextAlignment(.center)
//                    }
//                }
//                .frame(width: 307, height: 70)
//                //                    .padding(.bottom, 47)
//                VStack {
//                    HStack {
//                        HStack(spacing: 4) {
//                            ForEach(0..<shuffleCount, id: \.self) { _ in
//                                Image(systemName: "heart.fill")
//                                    .foregroundColor(.red)
//                                    .font(.system(size: 20))
//                            }
//                        }
//                        Spacer()
//                    }
//                    .padding(.horizontal, 50)
//
//                    // Buttons section
//                    //                    HStack(spacing: 20) {
//                    //                        Button {
//                    //                            if shuffleCount > 0 {
//                    //                                generated = data.generateData()
//                    //                                pickedThemeId = generated?.id
//                    //                                cardRotation = -90
//                    //                                cardID = UUID()
//                    //                                showPopup = true
//                    //                                shuffleCount -= 1
//                    //                            }
//                    //<<<<<<< HEAD:MSMA/Views/ContentView.swift
//                    //                            .frame(maxWidth: .infinity)
//                    //                            .multilineTextAlignment(.center)
//                    //                            Spacer()
//                    //                        }
//                    ////                        .padding(.horizontal, 50)
//                    //
//                    //                        // Buttons section
//                    //                        HStack(spacing: 20) {
//                    //                            Button {
//                    //                                if shuffleCount > 0 {
//                    //                                    generated = data.generateData()
//                    //                                    pickedThemeId = generated?.id
//                    //                                    navigate = true
//                    //                                    cardRotation = -90
//                    //                                    cardID = UUID()
//                    //                                    showPopup = true
//                    //                                    shuffleCount -= 1
//                    //                                    if !activeTheme {
//                    //                                        activeTheme = true
//                    //                                    }
//                    //                                }
//                    //                            } label: {
//                    //                                Image(systemName: "shuffle")
//                    //                                    .foregroundStyle(Color("AccentColor"))
//                    //                                    .frame(width: 65,height: 55)
//                    //                                    .background(Color("milk"))
//                    //                                    .font(.system(size: 24, weight: .bold))
//                    //                            }
//                    //                            .cornerRadius(5)
//                    //                            .shadow(radius: 4, x: 0, y: 4)
//                    //
//                    ////                            Button {
//                    ////                                if activeTheme {
//                    ////                                    themePicked = true
//                    ////                                    pickedThemeId = generated?.id
//                    ////                                    navModel.path.append(Route.main)
//                    ////                                    navModel.currentRoute = .main
//                    ////                                }
//                    ////                            } label: {
//                    ////                                Text("Ambil Tema")
//                    ////                                    .foregroundStyle(Color(activeTheme ? "milk" : "foregroundGrey"))
//                    ////                                    .padding(.vertical, 20)
//                    ////                                    .frame(maxWidth: 200)
//                    ////                                    .background(Color(activeTheme ? "AccentColor" : "backgroundGrey"))
//                    ////                                    .fontWeight(.bold)
//                    ////                            }
//                    ////                            .disabled(!activeTheme)
//                    ////                            .cornerRadius(6)
//                    ////                            .shadow(radius: activeTheme ? 4 : 0, x: 0, y: activeTheme ? 4 : 0)
//                    ////                            .popoverTip(shuffleTip)
//                    //                        }
//                    //                        .padding(.bottom, 60)
//                    //                    }}
//                    //                .padding(.vertical, 170)
//                    //                if showPopup {
//                    //                    PopUpView(
//                    //                        isPresented: $showPopup,
//                    //                        generated: $generated,
//                    //                        navigate: $navigate,
//                    //                        pickedThemeId: $pickedThemeId,
//                    //                        themePicked: $themePicked,
//                    //                        shuffleCount: $shuffleCount,
//                    //                        rotationAngle: cardRotation,
//                    //                        cardID: cardID
//                    //                    )
//                    //                    .zIndex(2)
//                    //                }
//                }
//                //            .toolbar {
//                //                ToolbarItem(placement: .bottomBar){
//                //                    HStack{
//                //                        Spacer()
//                //                        Button{
//                //                            navModel.path.append(Route.main)
//                //                            navModel.currentRoute = Route.main
//                //                        }label: {
//                //                            VStack {
//                //                                Image(systemName: "house.fill")
//                //                                    .imageScale(.large)
//                //                                Text("Home")
//                //                            }
//                //                            .foregroundStyle(Color(navModel.currentRoute == Route.main ? "AccentColor" : "foregroundGrey"))
//                //                        }
//                //                        .disabled(navModel.currentRoute == Route.main)
//                //                        Spacer()
//                //                        Button{
//                //                            navModel.path.append(Route.profile)
//                //                            navModel.currentRoute = Route.profile
//                //                        }label: {
//                //                            VStack {
//                //                                Image(systemName: "person.fill")
//                //                                    .imageScale(.large)
//                //                                Text("Profile")
//                //                            }
//                //                            .foregroundStyle(Color(navModel.currentRoute == Route.profile ? "AccentColor" : "foregroundGrey"))
//                //                        }
//                //                        .disabled(navModel.currentRoute == Route.profile)
//                //                        Spacer()
//                //                    }
//                //                    .padding(.top)
//                //
//                //                }
//                //            }
//                .navigationDestination(for: Route.self){route in
//                    switch route{
//                    case .home:
//                        ShuffleThemeView(pickedThemeId: $pickedThemeId, themePicked: $themePicked)
//                    case .main:
//                        HomeView(pickedThemeId: $pickedThemeId, themePicked: $themePicked)
//                    case .profile:
//                        ProfileView()
//                        //=======
//                        //                        } label: {
//                        //                            Image(systemName: "shuffle")
//                        //                                .foregroundStyle(Color("AccentColor"))
//                        //                                .frame(width: 65,height: 55)
//                        //                                .background(Color("milk"))
//                        //                                .font(.system(size: 24, weight: .bold))
//                        //                        }
//                        //                        .cornerRadius(5)
//                        //                        .shadow(radius: 4, x: 0, y: 4)
//                        //
//                        //                        Button {
//                        //                            if let _ = generated {
//                        //                                // Update properties in single operation
//                        //                                DispatchQueue.main.async {
//                        //                                    themePicked = true
//                        //                                    pickedThemeId = generated?.id
//                        //                                }
//                        //                            }
//                        //                        } label: {
//                        //                            Text("Ambil Tema")
//                        //                                .foregroundStyle(Color(generated != nil ? "milk" : "foregroundGrey"))
//                        //                                .padding(.vertical, 20)
//                        //                                .frame(maxWidth: 200)
//                        //                                .background(Color(generated != nil ? "AccentColor" : "backgroundGrey"))
//                        //                                .fontWeight(.bold)
//                        //                        }
//                        //                        .disabled(generated == nil)
//                        //                        .cornerRadius(6)
//                        //                        .shadow(radius: generated != nil ? 4 : 0, x: 0, y: generated != nil ? 4 : 0)
//                        //                        .popoverTip(shuffleTip)
//                        //                    }
//                        //                    .padding(.bottom, 60)
//                        //>>>>>>> main:MSMA/Views/Home/ShuffleThemeView.swift
//                    }
//                }
//                .padding(.vertical, 170)
//
//                //            if showPopup {
//                //                PopUpView(
//                //                    isPresented: $showPopup,
//                //                    generated: $generated,
//                //                    navigate: .constant(false), // Removed navigation
//                //                    rotationAngle: cardRotation,
//                //                    cardID: cardID
//                //                )
//                //                .zIndex(2)
//                //            }
//            }
//        }
//    }
//
//
//}

//```ShuffleThemeView.swift
//
//  ContentView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//
import SwiftUI
import TipKit

struct ShuffleThemeView: View {

    //    @EnvironmentObject var navModel: NavigationModel
    @Binding var pickedThemeId: Int?
    @Binding var themePicked: Bool?
    
    //    @ObservedObject var questController: QuestController

    
    @ObservedObject var questController: QuestController

    
    @State private var shuffleCount: Int = 3
    @State private var data = Data()
    @State var generated: ThemeData? = nil
    @State var showPopup = false
    
    @State private var cardRotation: Double = -450
    @State private var cardID = UUID()
    
    let beginningTip = BeginningTip()
    let shuffleTip = ShuffleThemeTip()

    let takeThemeTip = TakeThemeTip()

    
    var body: some View {
        ZStack {
            Image("backgroundImage1")
                .resizable()
                .aspectRatio(contentMode:.fill)
                .ignoresSafeArea(edges: .all)
            
            DisplayGif(gifName: "dragonform2", size: 290)
                .offset(y: -40)
                .zIndex(0)
            
            VStack{
                VStack{
//                    Spacer()
                    Text("Miruu")
                        .font(.system(size: 65, weight: .bold, design: .rounded))
                        .foregroundStyle(Color("E0610B"))
                        .shadow(color: .white.opacity(0.9), radius: 4)
                        .shadow(color: .white.opacity(0.9), radius: 4)
                        .position(x: 200, y: 30)
//                    Spacer()
                }
                
                TipView(beginningTip)
                    .padding()
                
                VStack {
                    if let generated = generated{
                        Text(generated.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(Color("darkBlue"))
                        Text(generated.description)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(.bottom,30)
                .frame(width: 307, height: 70)
                
                VStack {
//                    Spacer()
                    HStack {
                        HStack(spacing: 4) {
                            ForEach(0..<shuffleCount, id: \.self) { _ in
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size: 20))
                                    .opacity(shuffleCount > 0 ? 1 : 0)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .padding(.horizontal, 70)
//                    Spacer()
                    // Buttons section
                    HStack(spacing: 20) {
                        Button {
                            if shuffleCount > 0 {
                                generated = data.generateData()
                                pickedThemeId = generated?.id
                                cardRotation = -90
                                cardID = UUID()
                                showPopup = true
                                shuffleCount -= 1
                            }
                        } label: {
                            Image(systemName: "shuffle")
                                .foregroundStyle(Color("AccentColor"))
                                .frame(maxWidth: 200, maxHeight: 55)
//                                .frame(width: 65,height: 55)
                                .background(Color("milk"))
                                .font(.system(size: 24, weight: .bold))
                        }
                        .cornerRadius(5)
                        .shadow(radius: 4, x: 0, y: 4)
                        .popoverTip(shuffleTip)
                        
                        //                        Button {
                        //                            if let _ = generated {
                        //                                // Take theme, update timestamp, and set properties
                        //                                DispatchQueue.main.async {
                        //                                    themePicked = true
                        //                                    pickedThemeId = generated?.id
                        ////                                    questController.updateThemeTimestamp()
                        //                                }
                        //                            }
                        //                        } label: {
                        //                            Text("Ambil Tema")
                        //                                .foregroundStyle(Color(generated != nil ? "milk" : "foregroundGrey"))
                        //                                .padding(.vertical, 20)
                        //                                .frame(maxWidth: 200)
                        //                                .background(Color(generated != nil ? "AccentColor" : "backgroundGrey"))
                        //                                .fontWeight(.bold)
                        //                        }
                        ////                        .popoverTip(takeThemeTip)
                        //                        .disabled(generated == nil)
                        //                        .cornerRadius(6)
                        //                        .shadow(radius: generated != nil ? 4 : 0, x: 0, y: generated != nil ? 4 : 0)
                        Button {
                            if let _ = generated {
                                // Take theme, update timestamp, and set properties
                                DispatchQueue.main.async {
                                    themePicked = true
                                    pickedThemeId = generated?.id
                                    questController.updateThemeTimestamp()
                                }
                            }
                        } label: {
                            Text("Ambil Tema")
                                .foregroundStyle(Color(generated != nil ? "milk" : "foregroundGrey"))
                                .padding(.vertical, 20)
                                .frame(maxWidth: 200)
                                .background(Color(generated != nil ? "AccentColor" : "backgroundGrey"))
                                .fontWeight(.bold)
                        }
                        .popoverTip(takeThemeTip)
                        .disabled(generated == nil)
                        .cornerRadius(6)
                        .shadow(radius: generated != nil ? 4 : 0, x: 0, y: generated != nil ? 4 : 0)
                    }
                    .padding(.bottom, 70)
                }
            }
            .padding(.vertical, 150)
            
            if showPopup {
                PopUpView(
                    isPresented: $showPopup,
                    generated: $generated,
                    navigate: .constant(false),
                    pickedThemeId: $pickedThemeId,
                    themePicked: $themePicked,
                    shuffleCount: $shuffleCount,
                    rotationAngle: cardRotation,
                    cardID: cardID
                )
                .padding(.bottom, 140)
                .zIndex(2)
            }
        }
        .onAppear {
            // Reset shuffle count when view appears
            if shuffleCount < 3 {
                shuffleCount = 3
            }
            // Ensure theme is properly reset if needed

            questController.checkAndResetThemeIfNeeded()
        }
    }
}
//```
