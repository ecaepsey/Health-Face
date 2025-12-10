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
//            Text(isSelected ? "Selected" : "Select")
//                .padding(8)
//
//                .cornerRadius(8)
        }
        .background(.clear)
        
    }
}

