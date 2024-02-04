//
//  ClientExamsCoordinator.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import XCoordinator

enum ClientExamsRoute: Route {
    case home
    case next
}

final class ClientExamsCoordinator: NavigationCoordinator<ClientExamsRoute> {

    private let appRouter: UnownedRouter<AppRoute>

    init(appRouter: UnownedRouter<AppRoute>) {
        self.appRouter = appRouter
        super.init(rootViewController: BaseNavigationController(), initialRoute: .home)
    }

    override func prepareTransition(for route: ClientExamsRoute)
    -> NavigationTransition {
        switch route {

        case .home:
            let controller = ClientExamsController()
            controller.viewModel.router = unownedRouter
            return .set([controller])

        case .next:
            let controller = ClientExamsController()
            controller.hidesBottomBarWhenPushed = true
            return .push(controller)
        }
    }
}
