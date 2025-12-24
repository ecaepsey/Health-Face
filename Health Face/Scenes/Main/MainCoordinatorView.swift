//
//  MainCoordinatorView.swift
//  Health Face
//
//  Created by Damir Aushenov on 25/12/25.
//






import SwiftUI

struct MainCoordinatorView: View {

    enum Tab {
        case home
        case favorites
        case profile
    }

    @State private var selectedTab = Tab.home

    private let factory: ScreenFactory
    private let homeCoordinator: HomeCoordinator
    private let historyCoordinator: HistoryCoordinator
 

    init(factory: ScreenFactory, showAuthSceneHandler: @escaping () -> Void) {
        self.factory = factory

        homeCoordinator = .init(showAuthSceneHandler: showAuthSceneHandler)
        historyCoordinator = .init()
     
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeCoordinatorView(homeCoordinator, factory: factory)
                .tabItem {
                    Label("", systemImage: Constants.houseImage)
                }
                .tag(Tab.home)
            
            HistoryCoordinatorView(historyCoordinator, factory: factory)
                .tabItem {
                    Label("", systemImage: Constants.houseImage)
                }
                .tag(Tab.home)

           
        }
        
        .onAppear {
            setupTabBar()
        }
    }

    private enum Constants {
        static let houseImage = "house"
        static let heartImage = "heart"
        static let person = "person"
    }

    @MainActor private func setupTabBar() {
        
        UITabBar.appearance().isTranslucent = true

        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
      

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
    }
}
