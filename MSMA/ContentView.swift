//
//  ContentView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct ContentView: View {
    var data = Data()
//    @State var generatedData: ThemeData
    
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
            Button {
//                if let randomItem = data.listDataTheme.randomElement() {
//                                        generatedData = randomItem
//                                    }
            } label: {
                Text("Generate")
                    .foregroundStyle(Color(.black))
                    .padding(.vertical, 20)
                    .frame(maxWidth: 200)
                    .background(Color.gray)
                    .fontWeight(.bold)
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
            Spacer()
            Spacer()
            NavigationView()
        }
        

//        HStack {
//            Spacer()
//            VStack {
//                Image(systemName: "house.fill")
//                    .imageScale(.large)
//                Text("Home")
//            }
//            Spacer()
//            VStack {
//                Image(systemName: "person.fill")
//                    .imageScale(.large)
//                Text("Profile")
//            }
//            Spacer()
//        }
//        .padding()
//        .background(Color(UIColor.systemGray6))
    }
}

#Preview {
    ContentView( )
}
