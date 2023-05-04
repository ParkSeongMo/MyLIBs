//
//  RootBuilder.swift
//  Pine-Live
//
//  Created by Seongmo Park on 2023/04/25.
//

import NeedleFoundation
import RIBs

// MARK: - RootComponent

protocol RootDependency: NeedleFoundation.Dependency {}

// MARK: - RootComponent

final class RootComponent: NeedleFoundation.Component<RootDependency> {

  var mainTabBarViewController: RootViewControllable & MainTabBarPresentable & MainTabBarViewControllable {
    shared { MainTabBarViewController() }
  }

  var mainTabBarBuilder: MainTabBarBuildable {
    MainTabBarBuilder {
      MainTabBarComponent(parent: self)
    }
  }
}

// MARK: - RootBuildable

protocol RootBuildable: Buildable {
  func build() -> LaunchRouting
}

// MARK: - RootBuilder

final class RootBuilder: SimpleComponentizedBuilder<RootComponent, LaunchRouting>, RootBuildable {

  override func build(with component: RootComponent) -> LaunchRouting {
    let interactor = RootInteractor()
    return RootRouter(
      mainTabBarBuilder: component.mainTabBarBuilder,
      interactor: interactor,
      viewController: component.mainTabBarViewController
    )
  }
}
