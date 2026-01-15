//
//  CameraViewModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 19/11/25.
//

import CoreImage
import UIKit

final class CameraViewModel: ViewModel {
   
    
    
    @Published  var state: HomeViewState
    let healthUseCase: FetchHealthUseCase
    
    func handle(_ event: HomeViewEvent)  {
        switch event {
        case .save:
            guard let image = state.image else { return }

            // 1. Сохраняем картинку на диск
            let filename = saveImageToDisk(image)
            
            Task {
                state.entries = try await healthUseCase.fetchHealth(for: "")
                let entry = HealthEntry(date: Date(),
                                        puffiness: state.puffiness,
                                        sleepQuality: state.sleep,
                                        skinCondition: state.skinCondition,
                                        notes: state.notes,
                                        imagePath: filename
                )
                
                state.entries.insert(entry, at: 0)
              
                
                
                
                healthUseCase.save(state.entries)
                
            }
            
          
            
           
           
            
        case .saveImage(let image):
            self.state.image = image
        default:
            break
        }
    }
    
    init(healthUseCase: FetchHealthUseCase) {
        state = .init()
        self.healthUseCase = healthUseCase
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


enum HomeViewEvent {
    case save
    case saveImage(UIImage)
}

public struct HomeViewState: Equatable {
    public var image: UIImage?
    public var skinCondition: String = ""
    public var notes: String = ""
    public var puffiness: Int = 0
    public var sleep: Int = 0
    
     var entries: [HealthEntry] = []
}
