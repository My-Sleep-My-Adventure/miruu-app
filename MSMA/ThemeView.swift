//
//  ThemeView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct ThemeView: View {
    @State private var data = Data()
    enum AchievementStatus: String {
        case complete = "complete"
        case incomplete = "incomplete"
        case locked = "locked"
    }
    
    
    var body: some View {
        NavigationStack{
            Text("\(data.unlockedCountTheme)/\(data.listDataTheme.count)")
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 20) {
                    ForEach(0..<data.listDataTheme.count) { index in
                        VStack {
                            if data.listDataTheme[index].status == "complete"{
                                NavigationLink(destination: ThemeDetail(data : data.listDataTheme[index])) {
//                                    Circle()
//                                        .stroke( Color.blue, lineWidth: 2)
//                                        .frame(width: 60, height: 60)
                                    Image(data.listDataTheme[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                }
                                
                                Text(data.listDataTheme[index].name)
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }else if data.listDataTheme[index].status == "incomplete"{
                                NavigationLink(destination: ThemeDetail(data : data.listDataTheme[index])) {
                                    Image(data.listDataTheme[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .saturation(0.2)
                                }
                                
                                Text(data.listDataTheme[index].name)
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }else{
                                RoundedRectangle(cornerRadius: 20)
                                        .stroke( Color.red, lineWidth: 2)
                                        .frame(width: 100, height: 100)
                                        .overlay(Text("?").font(.title3).foregroundColor(.black))
                                
                                Text("Locked")
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .background(Color("milk"))
        
        
    }
    
}



#Preview {
    ThemeView()
}
