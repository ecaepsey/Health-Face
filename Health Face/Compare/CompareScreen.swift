import SwiftUI

struct CompareView: View {
    let first: HealthEntry
    let second: HealthEntry
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey("CompareView.compare.text"))
                .font(.title2)
                .bold()
            
            HStack {
               
                entryImage(first)
                entryImage(second)
            }
            .padding()
            
            
            
            HStack {
                VStack(spacing: 12) {

                    HStack {
                        Text(LocalizedStringKey("CompareView.hydration.text"))
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("\(first.puffiness)")
                            .font(.headline)
                    }

                    HStack {
                        Text(LocalizedStringKey("CompareView.sleep.text"))
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("\(first.sleepQuality)")
                            .font(.headline)
                    }

                    HStack {
                        Text(LocalizedStringKey("CompareView.skin.text"))
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("\(first.skinCondition)")
                            .font(.headline)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray.opacity(0.1))
                )

                Spacer()
                VStack(spacing: 12) {

                    HStack {
                        Text(LocalizedStringKey("CompareView.hydration.text"))
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("\(second.puffiness)")
                            .font(.headline)
                    }

                    HStack {
                        Text(LocalizedStringKey("CompareView.sleep.text"))
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("\(second.sleepQuality)")
                            .font(.headline)
                    }

                    HStack {
                        Text(LocalizedStringKey("CompareView.skin.text"))
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("\(second.skinCondition)")
                            .font(.headline)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray.opacity(0.1))
                )

            }
            .font(.caption)
            .padding(.horizontal)
            
            Spacer()
        }
        
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
       private func entryImage(_ entry: HealthEntry) -> some View {
           if let fileName = entry.imagePath,
              let uiImage = loadImage(fileName: fileName) {
               Image(uiImage: uiImage)
                   .resizable()
                   .scaledToFit()
                   .cornerRadius(12)
           } else {
               ZStack {
                   RoundedRectangle(cornerRadius: 12)
                       .stroke(.gray.opacity(0.4), style: StrokeStyle(lineWidth: 1, dash: [5]))
                   Text("Нет фото")
                       .font(.caption)
                       .foregroundColor(.secondary)
               }
           }
       }
    
    private func loadImage(fileName: String) -> UIImage? {
           let docsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
           let fileURL = docsURL.appendingPathComponent(fileName)
           return UIImage(contentsOfFile: fileURL.path)
       }
}
