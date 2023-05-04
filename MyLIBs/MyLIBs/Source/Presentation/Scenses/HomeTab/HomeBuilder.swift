//
//  HomeBuilder.swift
//  Pine-Live
//
//  Created by Seongmo Park on 2023/04/25.
//

import NeedleFoundation
import RIBs

// MARK: - HomeDependency

protocol HomeDependency: NeedleFoundation.Dependency {
}

// MARK: - HomeBuildDependency

struct HomeBuildDependency {
    let listener: HomeListener
}

// MARK: - HomeComponent
final class HomeComponent: NeedleFoundation.Component<HomeDependency> {
    
    var initialState: HomePresentableState {
        HomePresentableState()
    }
}


// MARK: - HomeBuildable

protocol HomeBuildable: Buildable {
    func build(with dynamicBuildDependency: HomeBuildDependency) -> HomeRouting
}

// MARK: HomeBuilder

final class HomeBuilder: ComponentizedBuilder<HomeComponent, HomeRouting, HomeBuildDependency, Void>, HomeBuildable {
    
    weak var interactor: HomeInteractor?
    
    func build(with dynamicBuildDependency: HomeBuildDependency) -> HomeRouting {
        let router = super.build(with: dynamicBuildDependency)
        return router
    }
    
    override func build(with component: HomeComponent,
                        _ payload: HomeBuildDependency) -> HomeRouting {
        let viewController = HomeViewController()
        let interactor =  HomeInteractor(presenter: viewController,
                                         initialState: component.initialState)
        interactor.listener = payload.listener
        
        self.interactor = interactor
        
        return HomeRouter(
            interactor: interactor,
            viewController: viewController
        )
    }
}
