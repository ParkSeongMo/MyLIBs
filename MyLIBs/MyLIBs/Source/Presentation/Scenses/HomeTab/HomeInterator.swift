//
//  HomeInteractor.swift
//  Pine-Live
//
//  Created by Seongmo Park on 2023/04/25.
//

import Foundation
import ReactorKit
import RIBs
import RxSwift

// MARK: - HomeRouting
protocol HomeRouting: ViewableRouting {
}

// MARK: - HomePresentable
protocol HomePresentable: Presentable {
    var listener: HomePresentableListener? { get set }
}

// MARK: - HomeListener

protocol HomeListener: AnyObject { }


// MARK: HomeInteractor

final class HomeInteractor:
    PresentableInteractor<HomePresentable>,
    HomeInteractable,
    HomePresentableListener,
    Reactor {
    
    // MARK: - Reactor
    typealias Action = HomePresentableAction
    typealias State = HomePresentableState
    
    enum Mutation {
    }
    
    // MARK: - Properties
    
    weak var router: HomeRouting?
    weak var listener: HomeListener?
    
    var initialState: HomePresentableState
    
    
    // MARK: - Initialization & Deinitialization
    init(
        presenter: HomePresentable,
        initialState: HomePresentableState) {
            self.initialState = initialState
            
            super.init(presenter: presenter)
            presenter.listener = self
        }
    
    override func didBecomeActive() {
        super.didBecomeActive()
    }
    
    // MARK: - HomePresentableListener
    
    func sendAction(_ action: Action) {
        self.action.on(.next(action))
    }
}

extension HomeInteractor {
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        default:
            return Observable.empty()
        }
    }
}

// MARK: - transform mutation

extension HomeInteractor {
    func transform(mutation: Observable<Mutation>) -> Observable<Mutation> {
        return .merge(mutation)
            .withUnretained(self)
            .flatMap { this, mutation -> Observable<Mutation> in
                switch mutation {
                default:
                    return .just(mutation)
                }
            }
    }
}

// MARK: - reduce

extension HomeInteractor {
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        default:
            return newState
        }
        return newState
    }
}
