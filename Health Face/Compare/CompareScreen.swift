import SwiftUI

struct CompareView: View {
    let first: HealthEntry
    let second: HealthEntry
    
    var body: some View {
        VStack {
            Text("Сравнения")
                .font(.title2)
                .bold()
            
            HStack {
               
                entryImage(first)
                entryImage(second)
            }
            .padding()
            
            HStack {
                Text(first.date.formatted(date: .abbreviated, time: .omitted))
                Spacer()
                Text(second.date.formatted(date: .abbreviated, time: .omitted))
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
