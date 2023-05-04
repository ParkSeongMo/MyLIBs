//
//  HomeViewController.swift
//  Pine-Live
//
//  Created by Seongmo Park on 2023/04/25.
//

import UIKit
import RxSwift

enum HomePresentableAction {
}

protocol HomePresentableListener: AnyObject {
    typealias Action = HomePresentableAction
    typealias State = HomePresentableState
    
    func sendAction(_ action:Action)
    var state: Observable<State> { get }
    var currentState: State { get }
}

final class HomeViewController:
    UIViewController,
    HomePresentable,
    HomeViewControllable {
    
    
    // MARK: - Properties
    weak var listener: HomePresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
    }
}

