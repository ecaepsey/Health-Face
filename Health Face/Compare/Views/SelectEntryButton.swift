//
//  SelectEntryButton.swift
//  Health Face
//
//  Created by Damir Aushenov on 25/11/25.
//

import SwiftUI

struct SelectEntryButton: View {
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            Text(isSelected ? "Selected" : "Select")
                .padding(8)
                .background(isSelected ? .green.opacity(0.2) : .gray.opacity(0.1))
                .cornerRadius(8)
        }
    }
}

