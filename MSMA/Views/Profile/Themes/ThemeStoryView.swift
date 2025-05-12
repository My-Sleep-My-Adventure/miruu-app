//
//  ThemeStoryView.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 12/05/25.
//

import SwiftUI

struct ThemeStoryView: View {
    enum Feeling {
        case sad, flat, happy
    }
    
    // State for theme badge pop up
    @State private var showAnimationCard = false
    @State private var navigateToProfile = false
    
    // State for success alert
    @State private var showSuccessAlert: Bool = false
    
    @State private var selectedFeeling: Feeling? = nil
    @State private var themeStoryText: String = ""
    
    var onCompletion: () -> Void = {}
    
    // Env for dismiss
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Bagaimana perasaan kamu setelah menyelesaikan seluruh misi, Penjelajah?")
                .multilineTextAlignment(.center)
            .frame(maxWidth: 300)
            .padding(.top, 20)
            HStack {
                Button {
                    selectedFeeling = .sad
                } label: {
                    Image(selectedFeeling == .sad ? "sadactive" : "sadgrey")
                }
                .padding(10) // Hardcoded view inconsistent
                
                Button {
                    selectedFeeling = .flat
                } label: {
                    Image(selectedFeeling == .flat ? "flatactive" : "flatgrey")
                }
                .padding()
                
                Button {
                    selectedFeeling = .happy
                } label: {
                    Image(selectedFeeling == .happy ? "smileactive" : "smilegrey")
                }
            }
            
            // Text Editor
            TextEditor(text: $themeStoryText)
                .padding(4)
                .frame(width: 320, height: 100)
                .background(
                    RoundedRectangle(
                        cornerRadius: 10
                    )
                    .stroke(
                        Color.gray.opacity(0.2),
                        lineWidth: 1.5
                    )
                )
                .autocorrectionDisabled(true)
            
            Button {
                
            } label: {
                Text("Simpan Jejakmu!")
                    .foregroundColor(Color("milk"))
                    .fontWeight(.bold)
                    .frame(maxWidth: 320, maxHeight: 50)
                    .padding(.vertical, 8)
                    .background(Color("E0610B"))
            }
            .cornerRadius(20)
            .padding(.top, 20)
            .alert("Berhasil menyimpan gambar", isPresented: $showSuccessAlert) {
                Button("Oke") {
                    
                    showAnimationCard = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        showAnimationCard = false
                        navigateToProfile = true
                    }
                    onCompletion()
                    dismiss()
                }
            }
            .padding(.top, 10)
        }
    }
}

#Preview {
    ThemeStoryView()
}
