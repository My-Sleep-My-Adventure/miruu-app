//
//  ContentView.swift
//  MSMA
//
//  Created by M Ikhsan Azis Pane on 04/05/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var data = Data()
    
    // State binding for key learning sheet
    @State private var isKeyLearningSheetPresented: Bool = false
    
    // State binding for keyLearningViewModel
    @StateObject var keyLearningViewModel = KeyLearningModel()

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("7FC2CA"), Color("FFFFFF")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                VStack {
                    ZStack {
                        Image("cloud")
                        VStack {
                            //                        HStack{
                            //                            Spacer()
                            //                            Image(systemName: "info.circle")
                            //                                .padding()
                            //                                .font(.system(size: 20))
                            //                        }
                            HStack{
                                VStack(alignment: .leading){
                                    Text(data.listDataTheme[0].name)
                                        .font(.title)
                                        .bold()
                                    
                                    Text("23h 15m")
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                }
                                .padding()
                                
                                Spacer()
                                
                                DisplayGif(gifName: "dragonform2", size: 160)
                                    .frame(maxWidth: 160, maxHeight: 160)
                                //                                .background(Color.white)
                                
                                //                            .background(Color.white)
                                //                        RoundedRectangle(cornerRadius: 20)
                                //                            .stroke(Color.white, lineWidth: 2)
                                //                            .frame(width: 80, height: 80)
                                //                            .overlay(Text("Character").foregroundColor(.white))
                            }
                            .padding()
                        }
                    }
                    
                    //                    .padding()
                    //                                        .background(Color.red)
                    
                    VStack(spacing: 15) {
                        ForEach(0..<5) { index in
                            //                            Button{} label: {
                            HStack {
                                ZStack{
                                    //                                    Image("tabcard\(index+1)")
                                HStack{
                                    VStack{
                                        Circle()
                                            .foregroundStyle(.white)
                                            .background(Color("FCF5EF"))
                                            .frame(width: 50, height: 50)
                                            .overlay(Image("cardicon\(index+1)"))
                                        
                                        
                                        
                                    }
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color("E0610B"))
                                    }
                                    
                                    Spacer()
                                    VStack(alignment: .leading){
                                        Text(data.listDataTheme[0].challenges[index].name)
                                            .foregroundStyle(.black)
                                            .font(.system(size: 18))
                                            .bold()
                                        
                                        Text(data.listDataTheme[0].challenges[index].description)
                                            .foregroundStyle(.gray)
                                            .font(.system(size: 16))
                                            .lineLimit(1) // show only one line
                                            .truncationMode(.tail)
                                        
                                    }
                                    .frame(width: 220)
                                    .padding(.leading, 20)
                                    Spacer()
                                    Spacer()
                                }
                                
                            }
                            .padding()
                            .frame(maxWidth: 340, maxHeight: 75)
                            .background(Color("FCF5EF"))
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color("A5D4DA"), lineWidth: 1)
                            )
                            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                            //                            }
                            
                        }
                    }
                    .padding(.horizontal)
                    //            }
                    Spacer()
                    Button {
                        isKeyLearningSheetPresented.toggle()
                    } label: {
                        Text("Complete")
                            .foregroundStyle(Color("milk"))
                            .padding(.vertical, 20)
                            .frame(maxWidth: 165, maxHeight: 50)
                            .background(Color("E0610B"))
                            .fontWeight(.bold)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .sheet(isPresented: $isKeyLearningSheetPresented) {
                        EditableRectangularImageDocumentation(viewModel: keyLearningViewModel)
                    }
                    Spacer()
                    Spacer()
                }
            }
            //            .frame(maxHeight: 250)
            
            
            Spacer()
            //            ScrollView {
            NavigationView()
        }
        //        .background(Color("milk"))
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
