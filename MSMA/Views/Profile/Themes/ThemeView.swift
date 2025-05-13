////
////  ThemeView.swift
////  MSMA
////
////  Created by M Ikhsan Azis Pane on 04/05/25.
////

// ThemeView.swift
import SwiftUI
import SwiftData

struct ThemeView: View {
    @EnvironmentObject var data: Data
    
    // Query for all stories
    @Query var stories: [Story]
    
    enum AchievementStatus: String {
        case complete = "complete"
        case incomplete = "incomplete"
        case locked = "locked"
    }
    
    var body: some View {
        VStack {
            HStack() {
                Text("Daftar Tema")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
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
                                NavigationLink(destination: ThemeDetail(data: data.listDataTheme[index])) {
                                    Image(data.listDataTheme[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 86, height: 106)
  
                                }
                                
                                Text(data.listDataTheme[index].name)
                                    .font(.caption)
                                    .foregroundColor(.black)
                            } else if data.listDataTheme[index].status == .incomplete {
                                NavigationLink(destination: ThemeDetail(data: data.listDataTheme[index])) {
                                    Image(data.listDataTheme[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 86, height: 106)
                                }
                                
                                Text(data.listDataTheme[index].name)
                                    .font(.caption)
                                    .foregroundColor(.black)
                            } else {
                                Image("grayscaleframe")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 86, height: 106)
                                Text("           ")
                            }
                        }
                        .padding(.bottom, 8)
                    }
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("FEFCFA").opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
    }
}


#Preview {
    ThemeView()
}
