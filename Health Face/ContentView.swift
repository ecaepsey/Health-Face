//
//  ContentView.swift
//  Health Face
//
//  Created by Damir Aushenov on 18/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            Button {
                        print("Нажал кнопку")
                    } label: {
                        Text("Сделай фото")
                            
                            .padding()
                            .fontWeight(.bold)
                    }
                    
                    .background(Color.black)
                    .foregroundStyle(.white)
                    .cornerRadius(20)
                    
            
            Text("Ваш эжедневный чек лица")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
            
        }
        
        .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
    }
}

#Preview {
    ContentView()
}
