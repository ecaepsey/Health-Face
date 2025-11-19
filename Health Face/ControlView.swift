//
//  ControlView.swift
//  Health Face
//
//  Created by Damir Aushenov on 19/11/25.
//

import SwiftUI

struct ControlView: View {
    var body: some View {
        VStack{
                    Spacer()
                    HStack {
                        Button {
                            PhotoManager.take()
                        } label: {
                            Image(systemName: "camera.fill")
                        }.font(.largeTitle)
                            .buttonStyle(.borderless)
                            .controlSize(.large)
                            .tint(.accentColor)
                            .padding(10)
                    }
                }
        VStack() {
            Button {
                    PhotoManager.take()
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
//        
//        .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView()
    }
}
