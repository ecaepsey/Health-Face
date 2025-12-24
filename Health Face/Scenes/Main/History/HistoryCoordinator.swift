//
//  HIstoryCoordinator.swift
//  Health Face
//
//  Created by Damir Aushenov on 25/12/25.
//

import Foundation

import Foundation



final class HistoryCoordinator: Coordinator {
    
    enum Screen: Routable {
        
    }
    
    @Published var navigationPath = [Screen]()
   
}

extension HistoryCoordinator: HistoryCoordinatorProtocol {
      
    
}
