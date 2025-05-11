//
//  KeyLearningSheetView.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 08/05/25.
//
//
//  KeyLearningSheetView.swift
//  MSMA
//
//  Created by Pramuditha Muhammad Ikhwan on 08/05/25.
//

import SwiftUI
import PhotosUI
import SwiftData

// MARK: - Image Views

struct ImageDocumentation: View {
    let imageState: KeyLearningModel.ImageState
    
    var body: some View {
        switch imageState {
        case .loading:
            ProgressView()
        case .success(let image):
            image.image.resizable()
        case .failure(let error):
            Text("Error: \(error.localizedDescription)")
                .foregroundColor(.red)
                .font(.caption)
        case .empty:
            EmptyView()
        }
    }
}

struct RectangularImageDocumentation: View {
    let imageState: KeyLearningModel.ImageState
    
    var body: some View {
        ImageDocumentation(imageState: imageState)
            .scaledToFill()
            .frame(width: 320, height: 320)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
    }
}

// MARK: - Main View

struct EditableRectangularImageDocumentation: View {
    
    @State private var keyLearningStory: String = ""
    @State private var showSuccessAlert: Bool = false
    @State private var navigateToSavedStories = false
    @State private var showImagePicker = false
    @State private var showImageSourceDialog = false
    @State private var imageSourceType: UIImagePickerController.SourceType = .photoLibrary
    @ObservedObject var viewModel: KeyLearningModel
    
    
    // Env for database
    @Environment(\.modelContext) private var modelContext
    
    // Env for dismiss
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    
                    // Drag indicator
                    Capsule()
                        .fill(Color.secondary.opacity(0.3))
                        .frame(width: 30, height: 3)
                        .padding(.top, 10)
                    
                    // Title and Instructions
                    VStack(alignment: .center, spacing: 8) {
                        Text("Catatan Petualangan")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("Apa yang paling berkesan dari tantangan ini?")
                            .font(.caption)
                            .fontWeight(.semibold)
                        
                        Text("Ceritakan hal baru yang kamu sadari, keterampilan yang berkembang, atau pengalaman yang membuka perspektifmu.")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 10)

                    // Image & Picker
                    RectangularImageDocumentation(imageState: viewModel.imageState)
                    
                    Button {
                        showImageSourceDialog = true
                    } label: {
                        if case .empty = viewModel.imageState {
                            ZStack {
                                AddImage()
                            }
                        } else {
                            HStack(spacing: 8) {
                                Text("Pilih gambar lagi")
                                Image(systemName: "square.and.arrow.up")
                            }
                            .foregroundStyle(.blue)
                            .padding(.top, 5)
                        }
                    }
                    .confirmationDialog("Pilih Sumber Gambar", isPresented: $showImageSourceDialog) {
                        Button("Ambil Foto") {
                            imageSourceType = .camera
                            showImagePicker = true
                        }
                        Button("Pilih dari Album") {
                            imageSourceType = .photoLibrary
                            showImagePicker = true
                        }
                        Button("Batal", role: .cancel) {}
                    }

                    // Text Editor
                    TextEditor(text: $keyLearningStory)
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
                        .sheet(isPresented: $showImagePicker) {
                            CameraAndPhotoPicker(sourceType: imageSourceType) { image in
                                viewModel.setImage(image)
                            }
                        }

                    // Save Button
                    Button {
                        if case let .success(doc) = viewModel.imageState {
                            saveStory(image: doc.uiImage, storyText: keyLearningStory, modelContext: modelContext)
                            showSuccessAlert = true
                            
                            // Navigasi setelah alert muncul sebentar
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                navigateToSavedStories = true
                            }
                        } else {
                            
                        }
                    } label: {
                        Text("Simpan")
                            .foregroundColor(Color("milk"))
                            .fontWeight(.bold)
                            .frame(maxWidth: 320, maxHeight: 50)
                            .padding(.vertical, 20)
                            .background(Color("E0610B"))
                    }
                    .cornerRadius(20)
                    .alert("Berhasil menyimpan gambar", isPresented: $showSuccessAlert) {
                        Button("Oke") {
                            dismiss()
                        }
                    }
                    .padding(.top, 10)
                }
                .padding()
            }
        }
    }
    
    func saveStory(image: UIImage, storyText: String, modelContext: ModelContext) {
        guard let imageData = image.jpegData(compressionQuality: 0.9) else { return }
        
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let uniqueName = UUID().uuidString + ".jpg"
        let fileURL = documentsURL.appendingPathComponent(uniqueName)
        
        do {
            try imageData.write(to: fileURL)
            
            let newStory = Story(imagePath: fileURL.path, storyText: storyText)
            modelContext.insert(newStory)
        } catch {
            print("Gagal menyimpan gambar \(error.localizedDescription)")
        }
    }
}


