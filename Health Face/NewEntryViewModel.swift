//
//  NewEntryViewModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 25/11/25.
//

import SwiftUI

final class NewEntryViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var skinCondition: String = ""
    @Published var notes: String = ""
    @Published var puffiness: Int?
    @Published var sleep: Int?

    private let storage = StorageService<HealthEntry>(fileName: "health_entries.json")

    // уже существующие записи
    @Published var entries: [HealthEntry] = []

    init() {
        entries = storage.load()
    }
    
    func load() {
        entries = storage.load()
    }

    func setImage(_ image: UIImage) {
        self.image = image
    }

    func save() {
        guard let image else { return }

        // 1. Сохраняем картинку на диск
        let filename = saveImageToDisk(image)

        // 2. Собираем HealthEntry
        let entry = HealthEntry(date: Date(),
                                puffiness: puffiness ?? 0,
                                sleepQuality: sleep ?? 0,
                                skinCondition: skinCondition,
                                notes: notes,
                                imagePath: filename
        )

        // 3. Обновляем массив и сохраняем в JSON
        entries.insert(entry, at: 0)
        storage.save(entries)

        // 4. Чистим драфт, если нужно
        self.image = nil
        self.skinCondition = ""
        self.notes = ""
    }

    private func saveImageToDisk(_ image: UIImage) -> String {
        let filename = UUID().uuidString + ".jpg"
        let url = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(filename)

        if let data = image.jpegData(compressionQuality: 0.9) {
            try? data.write(to: url)
        }

        return filename
    }
}
