//
//  ContentView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct PickChallenge: View {
    var data = Data()
    @State private var navigate = false
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
            Text("Supermarket")
                .font(.title)
                .bold()
                .padding()
            HStack(spacing: 10){
                
                Button { print(data.listDataTheme[0])
                } label: {
                    Image(systemName: "shuffle")
                        .foregroundStyle(Color(.black))
                        .padding(.vertical, 20)
                        .frame(maxWidth: 80)
                        .background(Color.gray)
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
                            .foregroundStyle(Color.black)
                            .padding(.vertical, 20)
                            .frame(maxWidth: 200)
                            .background(Color.gray)
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
    }
}


#Preview {
    PickChallenge()
}
