//
//  RootInteractor.swift
//  Pine-Live
//
//  Created by Seongmo Park on 2023/04/25.
//
import RIBs
import RxSwift

// MARK: - RootRouting

/// @mockable
protocol RootRouting: Routing {
  func attachMainTabBarRIB()
  func cleanupViews()
}

/// @mockable
protocol RootListener: AnyObject {}

// MARK: - RootInteractor

final class RootInteractor: Interactor, RootInteractable {

  weak var router: RootRouting?
  weak var listener: RootListener?

  override func didBecomeActive() {
    super.didBecomeActive()
    self.router?.attachMainTabBarRIB()
  }

  override func willResignActive() {
    super.willResignActive()
    self.router?.cleanupViews()
  }
}
