//
//  MainTabBarRouter.swift
//  RIBsReactorKit
//
//  Created by Elon on 2020/05/02.
//  Copyright © 2020 Elon. All rights reserved.
//

import RIBs
import UIKit

// MARK: - MainTabBarInteractable

/// @mockable
protocol MainTabBarInteractable:
    Interactable,
    HomeListener
{
    var router: MainTabBarRouting? { get set }
    var listener: MainTabBarListener? { get set }
}

// MARK: - MainTabBarViewControllable

/// @mockable
protocol MainTabBarViewControllable: ViewControllable {
    func setViewControllers(_ viewControllers: [ViewControllable], animated: Bool)
}

// MARK: - MainTabBarRouter

final class MainTabBarRouter:
    ViewableRouter<MainTabBarInteractable, MainTabBarViewControllable>,
    MainTabBarRouting
{
    
    // MARK: - Properties
    
    private let homeTabBuilder: HomeBuildable
    private var homeTabRouter: HomeRouting?
    
    // MARK: - Initialization & Deinitialization
    
    init(
        homeTabBuilder: HomeBuildable,
        interactor: MainTabBarInteractable,
        viewController: MainTabBarViewControllable
    ) {
        self.homeTabBuilder = homeTabBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

// MARK: - MainTabBarRouting

extension MainTabBarRouter {
    
    func attachTabs() {
        var tabs: [ViewControllable] = []
        let homeViewControllable = attachHomeTabRIB()
        tabs.append(makeMainViewController(viewControllable: homeViewControllable))
        
        viewController.setViewControllers(tabs, animated: false)
    }
    
    private func makeMainViewController(viewControllable: ViewControllable) -> UINavigationController {
        let viewController = UINavigationController(root: viewControllable)
        viewController.setNavigationBarHidden(true, animated: false)
        return viewController
    }
    
    private func attachHomeTabRIB() -> (ViewControllable) {
        let router = self.homeTabBuilder.build(
            with: HomeBuildDependency(
                listener: interactor))
        self.homeTabRouter = router
        attachChild(router)
        return router.viewControllable
    }
}
