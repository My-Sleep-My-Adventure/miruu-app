//
//  ContentView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var data = Data()
    @State var generated: ThemeData
    @State var navigate = false
    @State var navigate2 = false
    @State var showPopup = false
    @State var activeTheme = false
    @State var notRandomised = true
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Spacer()
                    Image(systemName: "info.circle")
                        .padding()
                        .font(.system(size: 20))
                }
                Spacer()
                VStack{
//                    RoundedRectangle(cornerRadius: 20)
//                        .stroke( Color.black, lineWidth: 2)
//                        .frame(width: 200, height: 200)
//                        .overlay(Text("Character"))
//                    Image("dragonform2")
//                        .frame(width: 200, height: 120, alignment: .center)
                    
                    DisplayGif(gifName: "dragonform2")

                }
//                Spacer()
                if activeTheme{
                    Text(generated.name).font(.title)
                }
                
                HStack(spacing: 10){
                    
                    Button {
                        if data.shuffleCount > 0{
                            generated = data.generateData()
                            generated = data.generateData()
                            navigate = true
                            showPopup = true
                            data.decrementShuffleCount()
                            print(data.shuffleCount)
                            print(generated)
                            if !activeTheme{
                                activeTheme = true
                                notRandomised = false
                            }

                        }

                        
                        
                    } label: {
                        Image(systemName: "shuffle")
                            .foregroundStyle(Color("milk"))
                            .padding(.vertical, 20)
                            .frame(maxWidth: 80)
                            .background(Color("purple"))
                            .fontWeight(.bold)
                    }
                    
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    NavigationLink(destination: HomeView(), isActive: $navigate2) {
                        EmptyView()
                    }
                    Button {
//                        generated = data.generateData()
                        navigate2 = true
//                        showPopup = true
                        
                        
                    } label: {
                        Text("Ambil Tema")
                            .foregroundStyle(Color("milk"))
                            .padding(.vertical, 20)
                            .frame(maxWidth: 200)
                            .background(Color(activeTheme ? "purple" : "grey"))
                            .fontWeight(.bold)
                    }
                    .disabled(notRandomised)
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                }
                Spacer()
                Spacer()
                NavigationView()
                
                
            }
            .background(Color("milk"))
        }
        
        .fullScreenCover(isPresented: $showPopup) {
            PopUpView(isPresented: $showPopup, generated: $generated, navigate: $navigate)
                .interactiveDismissDisabled(true)
        }
    }
    
}

#Preview {
    ContentView(generated: Data().listDataTheme.randomElement() ?? ThemeData(id: 1, name: "theme", description: "description is description", caution: "", xp: 0, status: .complete, image:"") )
}

//
//HStack(spacing: 10){
//    
//    Button {
//        if data.shuffleCount > 0{
//            generated = data.generateData()
//            data.decrementShuffleCount()
//            print(data.shuffleCount)
//        }
//
//        
//        
//    } label: {
//        Image(systemName: "shuffle")
//            .foregroundStyle(Color("milk"))
//            .padding(.vertical, 20)
//            .frame(maxWidth: 80)
//            .background(Color("purple"))
//            .fontWeight(.bold)
//    }
//    .disabled(!activeTheme)
//    .clipShape(RoundedRectangle(cornerRadius: 16))
//    
//    NavigationLink(destination: PickChallenge(generated: $generated), isActive: $navigate) {
//        EmptyView()
//    }
//    Button {
//        generated = data.generateData()
//        navigate = true
//        showPopup = true
//        
//        
//    } label: {
//        Text("Generate")
//            .foregroundStyle(Color("milk"))
//            .padding(.vertical, 20)
//            .frame(maxWidth: 200)
//            .background(Color("purple"))
//            .fontWeight(.bold)
//    }
//    .clipShape(RoundedRectangle(cornerRadius: 7))
//}
