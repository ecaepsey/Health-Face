//
//  EntryImageView.swift
//  Health Face
//
//  Created by Damir Aushenov on 25/11/25.
//

import SwiftUI

struct EntryImageView: View {
    let entry: HealthEntry
    
    var body: some View {
        if let uiImage = UIImage(contentsOfFile: entry.imagePath!) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
        } else {
            Rectangle()
                .overlay(Text("No image"))
        }
    }
}
