//
//  ContentView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct PickChallenge: View {
    @Binding var generated: ThemeData
//    @State private var generated: ThemeData
    
    @State var data = Data()
    @State private var navigate = false
//    @State private var navigate2 = false
    //    @State private var data = Data()
    //    var
    var body: some View {
        NavigationStack{
            HStack{
                Spacer()
                Image(systemName: "info.circle")
                    .padding()
                    .font(.system(size: 20))
            }
            Spacer()
            VStack{
                RoundedRectangle(cornerRadius: 20)
                    .stroke( Color.black, lineWidth: 2)
                    .frame(width: 200, height: 200)
                    .overlay(Text("Character"))
            }
            Spacer()
            Text(generated.name)
                .font(.title)
                .bold()
                .padding()
            HStack(spacing: 10){
//                NavigationLink(destination: PickChallenge(generated: $generated ), isActive: $navigate2) {
//                    
//                }
                Button {
                    if data.shuffleCount > 0{
                        generated = data.generateData()
                        data.decrementShuffleCount()
                        print(data.shuffleCount)
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
                
                Section{
                    NavigationLink(destination: HomeView(), isActive: $navigate){
                        
                    }
                    Button {
                        navigate = true
                    } label: {
                        Text("Pick Theme")
                            .foregroundStyle(Color("milk"))
                            .padding(.vertical, 20)
                            .frame(maxWidth: 200)
                            .background(Color("purple"))
                            .fontWeight(.bold)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                
            }
            .padding()
            
            Spacer()
            Spacer()
            
            NavigationView()
        }
        .background(Color("milk"))
        .navigationBarBackButtonHidden(true)
    }
}


//#Preview {
//    PickChallenge(generated: ThemeData(id: 1, name: "theme", description: "description is description", caution: "", xp: 0, status:"", image:""))
//}

