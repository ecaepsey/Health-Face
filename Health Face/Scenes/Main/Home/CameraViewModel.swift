//
//  CameraViewModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 19/11/25.
//

import CoreImage

final class CameraViewModel: ViewModel {
    
    @Published private(set) var state: HomeViewState

    func handle(_ event: HomeViewEvent) {
        
    }
    
    init() {
        state = .idle
    }
}


enum HomeViewEvent {
    
}

enum HomeViewState: Equatable {
    case idle
}
