import SwiftUI

struct CompareView: View {
    let first: HealthEntry
    let second: HealthEntry
    
    var body: some View {
        VStack {
            Text("Compare")
                .font(.title2)
                .bold()
            
            HStack {
                AsyncImage(url: URL(string: "https://i.pravatar.cc/300"))
                AsyncImage(url: URL(string: "https://i.pravatar.cc/300"))
//                entryImageView(entry: first)
//                entryImageView(entry: second)
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
        .navigationTitle("Сравнения")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func entryImageView(entry: HealthEntry) -> some View {
        Group {
            if let uiImage = UIImage(contentsOfFile: entry.imagePath) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            } else {
                Rectangle()
                    .overlay(Text("No image"))
            }
        }
    }
}
