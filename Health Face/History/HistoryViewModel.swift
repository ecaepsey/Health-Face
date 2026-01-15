//
//  HistoryViewModel.swift
//  Health Face
//
//  Created by Damir Aushenov on 24/12/25.
//

import Foundation

import SwiftUI

final class HistoryViewModel: ObservableObject {
    
  
   

    private let storage = StorageService<HealthEntry>(fileName: "health_entries.json")
    
    private let fetchHealhUseCase: FetchHealthUseCase
    
    public init(fetchHealhUseCase: FetchHealthUseCase) {
           self.fetchHealhUseCase = fetchHealhUseCase
       }

    // уже существующие записи
    @Published var entries: [HealthEntry] = []

//    init() {
//        entries = storage.load()
//    }
//    
    public func fetchHealth(for city: String) {
        Task  {
            do {
                let health = try await fetchHealhUseCase.fetchHealth(for: city)
                DispatchQueue.main.async {
                    self.entries = health
                }
                
            }
        }
        
//        fetchHealhUseCase.execute(city: city) { [weak self] result in
//              switch result {
//              case .success(let forecast):
//                  DispatchQueue.main.async {
//                      self?.entries = forecast
//                  }
//              case .failure(let error):
//                  DispatchQueue.main.async {
////                      self?.errorMessage = error.localizedDescription
//                  }
//              }
//          }
      }
    
    
    
    func load() {
        entries = storage.load()
    }

   

   

    
}
