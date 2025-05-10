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
            VStack{
                HStack(){
                    Text("Daftar Tema")
                        .font(.system( size: 16, weight: .bold, design: .rounded))
                        .font(.title3)
                    Spacer()
                    Text("\(data.unlockedCountTheme)/\(data.listDataTheme.count)")
                        .font(.system(size: 15, design: .rounded))
                        .foregroundStyle(Color.gray)
                    
                }
                .padding(.top)
                .padding(.horizontal, 30)
                
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 5) {
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
                                            .frame(width: 86, height: 106)
                                            .padding(.vertical, 8)
                                    }
                                    
                                    Text(data.listDataTheme[index].name)
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }else if data.listDataTheme[index].status == .incomplete {
                                    NavigationLink(destination: ThemeDetail(data : data.listDataTheme[index])) {
                                        Image(data.listDataTheme[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 86, height: 106)
                                            .padding(.vertical, 8)
                                    }
                                    
                                    Text(data.listDataTheme[index].name)
                                        .font(.caption)
                                        .foregroundColor(.black)
                                }else{
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .fill(Color("A5D4DA"))
//                                        .stroke(Color.black, lineWidth: 1)
//                                        .frame(width: 70, height: 90)
//                                        .overlay(
//                                            Text("?")
//                                                .font(.largeTitle)
//                                                .foregroundColor(Color("pickerbackground"))
//                                                .bold()
//                                        )
                                    Image("grayscaleframe")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 86, height: 106)
                                        .padding(.vertical, 8)
                                    Text("           ")
                                    
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .background(Color("FEFCFA").opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.top,8)
        .padding(.horizontal)
        
        
        
    }
    
}



#Preview {
    ThemeView()
}
