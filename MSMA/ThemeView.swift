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
                            if data.listDataTheme[index].status == .complete {
                                NavigationLink(destination: ThemeDetail(data : data.listDataTheme[index])) {
//                                    Circle()
//                                        .stroke( Color.blue, lineWidth: 2)
//                                        .frame(width: 60, height: 60)
                                    Image(data.listDataTheme[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 96, height: 120)
                                }
                                
                                Text(data.listDataTheme[index].name)
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }else if data.listDataTheme[index].status == .incomplete {
                                NavigationLink(destination: ThemeDetail(data : data.listDataTheme[index])) {
                                    Image(data.listDataTheme[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 96, height: 120)
                                }
                                
                                Text(data.listDataTheme[index].name)
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }else{
                                Image(data.listDataTheme[index].image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 96, height: 120)
                                
//                                Text("Locked")
//                                    .font(.caption)
//                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .background(Color.clear)
        
        
    }
    
}



#Preview {
    ThemeView()
}
