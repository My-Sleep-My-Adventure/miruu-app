//
//  QuestRowView.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 11/05/25.
//

import SwiftUI

struct QuestRow: View {
    let challenge: Challenge
    let index: Int
    let isCompleted: Bool

    var body: some View {
        NavigationLink {
            QuestDetailView(challenge: challenge)
        } label: {
            HStack {
                ZStack {
                    HStack {
                        VStack {
                            Circle()
                                .foregroundStyle(.white)
                                .background(Color("FCF5EF"))
                                .frame(width: 50, height: 50)
                                .overlay(Image("cardicon\(index + 1)"))
                        }
                        Spacer()
                        Image(systemName: isCompleted ? "checkmark.circle.fill" : "chevron.right")
                            .foregroundColor(isCompleted ? Color.success : Color("E0610B"))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text(challenge.name)
                            .foregroundStyle(isCompleted ? .success : .black)
                            .font(.system(size: 18))
                            .bold()
                        
                        Text(challenge.description)
                            .foregroundStyle(isCompleted ? .success : .gray)
                            .font(.system(size: 16))
                            .lineLimit(1)
                            .truncationMode(.tail)
                    }
                    .frame(width: 220)
                    .padding(.leading, 20)
                }
            }
            .padding()
            .frame(maxWidth: 340, maxHeight: 75)
            .background(Color("FCF5EF"))
            .cornerRadius(13)
            .overlay(
                RoundedRectangle(cornerRadius: 13)
                    .stroke(isCompleted ? Color.success : Color("A5D4DA"), lineWidth: isCompleted ? 3 : 1)
            )
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
    }
}


