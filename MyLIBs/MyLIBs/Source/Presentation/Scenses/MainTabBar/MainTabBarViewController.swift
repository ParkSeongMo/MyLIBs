//
//  MainTabBarViewController.swift
//  RIBsReactorKit
//
//  Created by Elon on 2020/05/02.
//  Copyright © 2020 Elon. All rights reserved.
//

import UIKit

import RIBs
import RxSwift

protocol MainTabBarPresentableListener: AnyObject {}

// MARK: - MainTabBarViewController

final class MainTabBarViewController:
  UITabBarController,
  MainTabBarPresentable,
  MainTabBarViewControllable
{

  // MARK: - Properties

  weak var listener: MainTabBarPresentableListener?

  // MARK: - Initialization & Deinitialization

  init() {
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
  }

  func setViewControllers(_ viewControllers: [ViewControllable], animated: Bool) {
    self.setViewControllers(
      viewControllers.map(\.uiviewController),
      animated: animated
    )
  }
}

// MARK: - RootViewControllable

extension MainTabBarViewController: RootViewControllable {}
