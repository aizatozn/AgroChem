//
//  ClientGreetingCoordinator.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import UIKit
import XCoordinator

enum GreetingRoute: Route {
    case home
    case next
}

final class GreetingCoordinator: NavigationCoordinator<GreetingRoute> {

    private let appRouter: UnownedRouter<AppRoute>

    init(appRouter: UnownedRouter<AppRoute>) {
        self.appRouter = appRouter
        super.init(rootViewController: BaseNavigationController(), initialRoute: .home)
    }

    // MARK: Overrides

    override func prepareTransition(for route: GreetingRoute) -> NavigationTransition {
        switch route {

        case .home:
            let controller = GreetingController()
            controller.viewModel.router = unownedRouter
            return .set([viewController])

        case .next:
            let controller = GreetingController()
            controller.viewModel.router = unownedRouter
            return .push(controller)
        }
    }
}
