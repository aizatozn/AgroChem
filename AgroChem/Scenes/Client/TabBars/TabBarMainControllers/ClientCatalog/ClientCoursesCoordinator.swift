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
    case medicineDetails(medicine: ClientCatalogModel)
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

        case .medicineDetails(medicine: let medicine):
            let controller = ClientMedicineController()
            controller.title = medicine.name
            return .push(controller)
        case .math(nameOfLesson: let nameOfLesson):
            break
        case .criticalThinking(nameOfLesson: let nameOfLesson):
            break
        case .сhemistry(nameOfLesson: let nameOfLesson):
            break
        case .advises(nameOfLesson: let nameOfLesson):
            break
        case .practiceTestSolutions(nameOfLesson: let nameOfLesson):
            return .push(GreetingController())
        }
        return .push(GreetingController())

    }
}
