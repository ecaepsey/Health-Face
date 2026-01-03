//
//  Health_FaceApp.swift
//  Health Face
//
//  Created by Damir Aushenov on 18/11/25.
//

import SwiftUI

@main
struct Health_FaceApp: App {
    @AppStorage("didCompleteOnboarding") var didCompleteOnboarding: Bool = false
    @Environment(\.colorScheme) var colorScheme
    private let appFactory = AppFactory()
    var body: some Scene {
      
        
        WindowGroup {
            
            AppCoordinatorView(
                          screenFactory: ScreenFactory(appFactory: appFactory),
                          coordinator: AppCoordinator(
                            fetchHealthUseCase: appFactory.makeFetchHealthUseCase()
                          )
                      )
            .preferredColorScheme(colorScheme == .dark ? .dark : .light)
                      .onAppear {
                         
                      }
                  }
        }
    
}
