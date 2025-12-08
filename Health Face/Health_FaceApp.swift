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
    var body: some Scene {
      

        WindowGroup {
            if didCompleteOnboarding {
                ContentView()
            } else {
                OnboardingView()
            }
        }
    }
}
