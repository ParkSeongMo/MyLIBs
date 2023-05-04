//
//  AppComponent.swift
//  Pine-Live
//
//  Created by Seongmo Park on 2023/04/25.
//

import NeedleFoundation

// MARK: - AppComponent

final class AppComponent: BootstrapComponent, RootDependency {
    var rootBuilder: RootBuildable {
        RootBuilder {
            RootComponent(parent: self)
        }
    }
}
