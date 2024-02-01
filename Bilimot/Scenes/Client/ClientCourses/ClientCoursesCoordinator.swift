//
//  ClientCoursesCoordinator.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import XCoordinator

enum ClientCoursesRoute: Route {
    case home
    case next
    case subject
}

final class ClientCoursesCoordinator: NavigationCoordinator<ClientCoursesRoute> {

    private let appRouter: UnownedRouter<AppRoute>

    init(appRouter: UnownedRouter<AppRoute>) {
        self.appRouter = appRouter
        super.init(rootViewController: BaseNavigationController(), initialRoute: .home)
    }

    override func prepareTransition(for route: ClientCoursesRoute)
    -> NavigationTransition {
        switch route {

        case .home:
            let controller = ClientCoursesController()
            controller.viewModel.router = unownedRouter
            return .set([controller])

        case .next:
            let controller = ClientCoursesController()
            controller.hidesBottomBarWhenPushed = true
            return .push(controller)

        case .subject:
            let controller = GreetingController()
            controller.viewModel.router = unownedRouter
            return .push(controller)
        }
    }
}
