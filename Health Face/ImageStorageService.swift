//
//  Untitled.swift
//  Health Face
//
//  Created by Damir Aushenov on 25/11/25.
//

import UIKit

final class ImageStorageService {

    static let shared = ImageStorageService()

    private init() {}

    func saveImage(_ image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 0.9) else { return nil }

        let filename = UUID().uuidString + ".jpg"
        let url = getDocumentsDirectory().appendingPathComponent(filename)

        do {
            try data.write(to: url)
            return filename // сохраняем только имя файла
        } catch {
            print("Error saving image:", error)
            return nil
        }
    }

    func loadImage(from filename: String) -> UIImage? {
        let url = getDocumentsDirectory().appendingPathComponent(filename)
        return UIImage(contentsOfFile: url.path)
    }

    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
