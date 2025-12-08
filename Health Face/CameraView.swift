//
//  CameraView.swift
//  Health Face
//
//  Created by Damir Aushenov on 20/11/25.
//

import AVFoundation

import SwiftUI

struct CameraView: View {
    @State private var showCamera = false
        @State private var image: UIImage?
    @State private var alertMessage: String?
       @State private var showAlert = false
    @ObservedObject var newEntryVM: NewEntryViewModel
    @State private var showReminderSettings = false   // <- добавили

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if let image {
                    // Show captured image
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 300)
                        .cornerRadius(12)
                        .padding()
                } else {
                    Text("No photo yet")
                        .foregroundColor(.secondary)
                }
                
                Button {
                    openCameraTapped()
                } label: {
                    Text("Сделай фото")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                Text("Ваш эжедневный чек лица")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                
                Spacer()
            }
            .navigationTitle("Health Face")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showReminderSettings = true
                    } label: {
                        Image(systemName: "bell")
                    }
                }
            }
            .sheet(isPresented: $showCamera, onDismiss: {
                if let image {
                    newEntryVM.setImage(image)   // <— кладём фото в общий VM
                }
            }) {
                ImagePicker(
                    sourceType: .camera,
                    selectedImage: $image
                )
            }
            .sheet(isPresented: $showReminderSettings) {
                ReminderView()
            }
            .alert("Camera error", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage ?? "Unknown error")
            }
        }
    }
    
    private func openCameraTapped() {
           // 1. Is camera hardware available?
           guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
               alertMessage = "Camera is not available on this device."
               showAlert = true
               return
           }

           // 2. Check authorization
           let status = AVCaptureDevice.authorizationStatus(for: .video)

           switch status {
           case .authorized:
               // Already authorized
               showCamera = true

           case .notDetermined:
               // Ask for permission
               AVCaptureDevice.requestAccess(for: .video) { granted in
                   DispatchQueue.main.async {
                       if granted {
                           self.showCamera = true
                       } else {
                           self.alertMessage = "Camera access was denied. You can enable it in Settings."
                           self.showAlert = true
                       }
                   }
               }

           case .denied, .restricted:
               alertMessage = "Camera access is disabled. Please enable it in Settings → Privacy → Camera."
               showAlert = true

           @unknown default:
               alertMessage = "Unexpected camera permission state."
               showAlert = true
           }
       }
}
