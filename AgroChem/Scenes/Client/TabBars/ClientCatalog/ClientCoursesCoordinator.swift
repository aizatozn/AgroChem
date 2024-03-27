//
//  ClientCoursesCoordinator.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import XCoordinator

enum ClientCatalogRoute: Route {
    case home
    case next
    case math(nameOfLesson: String)
    case criticalThinking(nameOfLesson: String)
    case сhemistry(nameOfLesson: String)
    case advises(nameOfLesson: String)
    case practiceTestSolutions(nameOfLesson: String)
}

final class ClientCoursesCoordinator: NavigationCoordinator<ClientCatalogRoute> {

    private let appRouter: UnownedRouter<AppRoute>

    init(appRouter: UnownedRouter<AppRoute>) {
        self.appRouter = appRouter
        super.init(rootViewController: BaseNavigationController(), initialRoute: .home)
    }

    override func prepareTransition(for route: ClientCatalogRoute)
    -> NavigationTransition {
        switch route {

        case .home:
            let controller = ClientCatalogController()
            controller.viewModel.router = unownedRouter
            return .set([controller])

        case .next:
            let controller = ClientCatalogController()
            controller.hidesBottomBarWhenPushed = true
            return .push(controller)

        case .math(let nameOfLesson):
            let controller = ClientMathLessonController()
            controller.title = nameOfLesson
            controller.viewModel.router = unownedRouter
            return .push(controller)

        case .criticalThinking(let nameOfLesson):
            let controller = ClientCriticalThinkingLessonController()
            controller.title = nameOfLesson
            controller.viewModel.router = unownedRouter
            return .push(controller)

        case .сhemistry(let nameOfLesson):
            let controller = ClientChemistryLessonController()
            controller.title = nameOfLesson
            controller.viewModel.router = unownedRouter
            return .push(controller)

        case .advises(let nameOfLesson):
            let controller = ClientAdvisesLessonController()
            controller.title = nameOfLesson
            controller.viewModel.router = unownedRouter
            return .push(controller)

        case .practiceTestSolutions(let nameOfLesson):
            let controller = ClientTestSolutionsLessonController()
            controller.title = nameOfLesson
            controller.viewModel.router = unownedRouter
            return .push(controller)
        }
    }
}
