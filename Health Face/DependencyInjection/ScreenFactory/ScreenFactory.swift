//
//  ScreenFactory.swift
//  Health Face
//
//  Created by Damir Aushenov on 25/12/25.
//

import Foundation

final class ScreenFactory: HomeCoordinatorFactory, HistoryCoordinatorFactory, AuthCoordinatorFactory {
    func makeHistoryView(coordinator: any HistoryCoordinatorProtocol) -> HistoryView {
        let vm = HistoryViewModel(fetchHealhUseCase: appFactory.makeFetchHealthUseCase())
        let view = HistoryView(viewModel: vm)
        
        return view
    }
    
    func makeHomeView(coordinator: any HomeCoordinatorProtocol) -> CameraView  {
       
               
        let view = CameraView(newEntryVM: NewEntryViewModel())
               return view
    }
    

    private let appFactory: AppFactory

    init(appFactory: AppFactory) {
        self.appFactory = appFactory
    }
}


extension ScreenFactory: LoginViewFactory {
    func makeLoginView(coordinator: AuthCoordinatorProtocol) -> LoginView {
        let viewModel = LoginViewModel(
            coordinator: coordinator
        )
        let view = LoginView(viewModel: viewModel)

        return view
    }
}

protocol HomeCoordinatorFactory: HomeViewFactory {}


@MainActor
protocol HomeViewFactory {
    func makeHomeView(coordinator: HomeCoordinatorProtocol) -> CameraView
}

@MainActor
protocol HomeCoordinatorProtocol {
    
}

protocol HistoryCoordinatorFactory: HistoryViewFactory {}

@MainActor
protocol HistoryCoordinatorProtocol {
    
}

@MainActor
protocol HistoryViewFactory {
    func makeHistoryView(coordinator: HistoryCoordinatorProtocol) -> HistoryView
}

protocol AuthCoordinatorFactory: LoginViewFactory
                                 {}


@MainActor
protocol LoginViewFactory {
    func makeLoginView(coordinator: AuthCoordinatorProtocol) -> LoginView
}
