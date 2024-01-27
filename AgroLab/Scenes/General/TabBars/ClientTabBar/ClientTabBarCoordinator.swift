//
//  ClientTabBarCoordinator.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import UIKit
import XCoordinator

enum ClientTabBarRoute: Route {
    case home
    case settings
}

final class ClientTabBarCoordinator: TabBarCoordinator<ClientTabBarRoute> {

    private let appRouter: UnownedRouter<AppRoute>

    private let homeRouter: StrongRouter<GreetingRoute>
    private let settingsRouter: StrongRouter<GreetingRoute>

    convenience init(appRouter: UnownedRouter<AppRoute>) {

        let homeCoordinator = GreetingCoordinator(appRouter: appRouter)

        let homeButton = UITabBarItem(
        title: "Home",
        image: UIImage(systemName: "house"),
        tag: 0)

        homeCoordinator.rootViewController.tabBarItem = homeButton

        let settingsCoordinator = GreetingCoordinator(appRouter: appRouter)

        let settingsButton = UITabBarItem(
        title: "Settings",
        image: UIImage(systemName: "geara"),
        tag: 0)

        settingsCoordinator.rootViewController.tabBarItem = settingsButton

        self.init(
            homeRouter: homeCoordinator.strongRouter,
            settingsRouter: settingsCoordinator.strongRouter,
            appRouter: appRouter
        )
    }

    init(
        homeRouter: StrongRouter<GreetingRoute>,
        settingsRouter: StrongRouter<GreetingRoute>,
        appRouter: UnownedRouter<AppRoute>
    ) {
        self.homeRouter = homeRouter
        self.settingsRouter = settingsRouter
        self.appRouter = appRouter

        super.init(
            rootViewController: ClientTabBarController(),
            tabs: [homeRouter, settingsRouter],
            select: homeRouter
        )
    }

    // MARK: Overrides

    override func prepareTransition(for route: ClientTabBarRoute) -> TabBarTransition {
        switch route {
        case .home:
            return .select(homeRouter)
        case .settings:
            return .select(settingsRouter)
        }
    }
}
