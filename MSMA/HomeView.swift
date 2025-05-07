//
//  ContentView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationStack {
            ZStack {
                VStack{
                    Color("purple")
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .frame(height: 300)
                        .ignoresSafeArea()
                        .opacity(0.9)
                }
                
                VStack {
                    HStack{
                        Spacer()
                        Image(systemName: "info.circle")
                            .padding()
                            .font(.system(size: 20))
                    }
                    HStack{
                        VStack(alignment: .leading){
                            Text("supermarket")
                                .font(.title)
                                .bold()
                            
                            Text("23h 15m")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        DisplayGif(gifName: "dragonform2", size: 200)
                            .frame(width: 160, height: 160)

//                            .background(Color.white)
//                        RoundedRectangle(cornerRadius: 20)
//                            .stroke(Color.white, lineWidth: 2)
//                            .frame(width: 80, height: 80)
//                            .overlay(Text("Character").foregroundColor(.white))
                    }
                    .padding()
                }
                .padding()
                
            }
            .frame(maxHeight: 250)
            
            
            Spacer()
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(0..<5) { index in
                        HStack {
                            Circle()
                                .stroke(lineWidth: 2)
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                            
                            Text("Bicara dengan kasir asdfsa asdfasf....")
                                .font(.body)
                                .lineLimit(1)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black.opacity(0.2), lineWidth: 1)
                        )
                    }
                }
                .padding(.horizontal)
            }
            Spacer()
            Button {
            } label: {
                Text("Complete")
                    .foregroundStyle(Color("milk"))
                    .padding(.vertical, 20)
                    .frame(maxWidth: 200)
                    .background(Color("purple"))
                    .fontWeight(.bold)
            }
            .clipShape(RoundedRectangle(cornerRadius: 7))
            Spacer()
            Spacer()
            
            NavigationView()
        }
        .background(Color("milk"))
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    HomeView()
//}
