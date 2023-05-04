//
//  HomeRouter.swift
//  Pine-Live
//
//  Created by Seongmo Park on 2023/04/25.
//

import RIBs


// MARK: - HomeInteractable

protocol HomeInteractable: Interactable {
    var router: HomeRouting? { get set }
    var listener: HomeListener? { get set }
}

protocol HomeViewControllable: ViewControllable {}

// MARK: - HomeRouter
final class HomeRouter:
    ViewableRouter<HomeInteractable, HomeViewControllable>,
    HomeRouting {
    
    override init(
        interactor: HomeInteractable,
        viewController: HomeViewControllable
    ) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
