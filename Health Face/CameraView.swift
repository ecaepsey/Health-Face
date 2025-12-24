import SwiftUI
import AVFoundation

struct CameraView: View {
    @State private var showCamera = false
    @State private var image: UIImage?

    @State private var alertMessage: String?
    @State private var showAlert = false

    @ObservedObject var newEntryVM: NewEntryViewModel

    @State private var showReminderSettings = false
    @State private var showAddRecordSheet = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {

                Text("Ваш ежедневный чек лица")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding(.top, 8)

                Spacer()

                if let image {
                    // ✅ REVIEW
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 340)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.horizontal)

                    // ✅ Actions after photo
                    HStack(spacing: 12) {
                        Button {
                            // переснять
                            self.image = nil
                           
                            openCameraTapped()
                        } label: {
                            Text("Переснять")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)

                        Button {
                            // открыть форму записи
                            showAddRecordSheet = true
                        } label: {
                            Text("Добавить запись")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                    }
                    .padding(.horizontal)

                } else {
                    // ✅ CAMERA EMPTY STATE
                    VStack(spacing: 10) {
                        Image(systemName: "camera.viewfinder")
                            .font(.system(size: 42))
                            .foregroundStyle(.secondary)

                        Text("Сделай фото, чтобы добавить запись")
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                }

                Spacer()

                // ✅ Main button (only when no photo yet)
                if image == nil {
                    Button {
                        openCameraTapped()
                    } label: {
                        Text("Сделай фото")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 12)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showReminderSettings = true
                    } label: {
                        Image(systemName: "bell")
                    }
                }
            }

            // ✅ Camera sheet
            .sheet(isPresented: $showCamera, onDismiss: {
                if let image {
                    newEntryVM.setImage(image) // кладём фото в VM
                    // не открываем форму автоматически — лучше дать пользователю кнопку
                }
            }) {
                ImagePicker(
                    sourceType: .camera,
                    selectedImage: $image
                )
            }

            // ✅ Add record sheet (your checklist / form)
            .sheet(isPresented: $showAddRecordSheet) {
                // Тут ты можешь показать свой экран формы
                // Важно: на Save -> сохранить entry и закрыть sheet
                CheckListScreen(viewModel: newEntryVM)
                    .presentationDetents([.medium, .large])
                    .presentationDragIndicator(.visible)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Сохранить") {
                                // ⚠️ замени на свой метод сохранения записи
                                newEntryVM.save()

                                showAddRecordSheet = false
                                image = nil
                            }
                        }
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Отмена") {
                                showAddRecordSheet = false
                            }
                        }
                    }
            }

            // ✅ Reminder
            .sheet(isPresented: $showReminderSettings) {
                ReminderView()
            }

            // ✅ Alerts
            .alert("Camera error", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage ?? "Unknown error")
            }
        }
    }

    private func openCameraTapped() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            alertMessage = "Camera is not available on this device."
            showAlert = true
            return
        }

        let status = AVCaptureDevice.authorizationStatus(for: .video)

        switch status {
        case .authorized:
            showCamera = true

        case .notDetermined:
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
