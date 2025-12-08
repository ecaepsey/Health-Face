//
//  OnboardingView.swift
//  Health Face
//
//  Created by Damir Aushenov on 3/12/25.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("didCompleteOnboarding") var didCompleteOnboarding = false
    @State private var page = 0

    var body: some View {
        TabView(selection: $page) {
            OnboardPage(
                title: "Welcome to HealthFace",
                subtitle: "Track daily changes and improve your skin.",
                imageName: "face.smiling"
            ).tag(0)

            OnboardPage(
                title: "How it works",
                subtitle: "1. Take photo\n2. Compare\n3. Track improvements",
                imageName: "camera"
            ).tag(1)

            OnboardPage(
                title: "Stay consistent",
                subtitle: "Enable reminders to take your daily face check.",
                imageName: "bell"
            ).tag(2)
        }
        .tabViewStyle(.page)
        .overlay(alignment: .bottom) {
            Button(action: nextPage) {
                Text(page == 2 ? "Start" : "Next")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding()
            }
        }
    }

    func nextPage() {
        if page < 2 {
            page += 1
        } else {
            didCompleteOnboarding = true
        }
    }
}

struct OnboardPage: View {
    let title: String
    let subtitle: String
    let imageName: String

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 180)
                .foregroundColor(.black)

            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(subtitle)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Spacer()
        }
    }
}
