//
//  Health_FaceApp.swift
//  Health Face
//
//  Created by Damir Aushenov on 18/11/25.
//

import SwiftUI
import FirebaseCore
@main
struct Health_FaceApp: App {
    @AppStorage("didCompleteOnboarding") var didCompleteOnboarding: Bool = false
    @Environment(\.colorScheme) var colorScheme
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
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

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
