//
//  ClientDirectoryCoordinator.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import XCoordinator

enum ClientDirectoryRoute: Route {
    case home
    case next
    case mathTest(nameOfLesson: String)
    case mathMainTest(nameOfLesson: String)
    case сhemTest(nameOfLesson: String)
}

final class ClientDirectoryCoordinator: NavigationCoordinator<ClientDirectoryRoute> {

    private let appRouter: UnownedRouter<AppRoute>

    init(appRouter: UnownedRouter<AppRoute>) {
        self.appRouter = appRouter
        super.init(rootViewController: BaseNavigationController(), initialRoute: .home)
    }

    override func prepareTransition(for route: ClientDirectoryRoute)
    -> NavigationTransition {
        switch route {

        case .home:
            let controller = ClientDirectoryController()
            controller.viewModel.router = unownedRouter
            return .set([controller])

        case .next:
            let controller = ClientDirectoryController()
            controller.hidesBottomBarWhenPushed = true
            return .push(controller)

        case .mathTest(let nameOfLesson):
            let controller = ClientMathTestController()
            controller.title = nameOfLesson
            controller.viewModel.router = unownedRouter
            return .push(controller)

        case .mathMainTest(let nameOfLesson):
            let controller = ClientMainMathTestController()
            controller.title = nameOfLesson
            controller.viewModel.router = unownedRouter
            return .push(controller)

        case .сhemTest(let nameOfLesson):
            let controller = ClientChemTestController()
            controller.title = nameOfLesson
            controller.viewModel.router = unownedRouter
            return .push(controller)
        }
    }
}
