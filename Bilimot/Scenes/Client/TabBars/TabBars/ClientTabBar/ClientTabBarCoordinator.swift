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
    case courses
    case exams
    case profile
}

final class ClientTabBarCoordinator: TabBarCoordinator<ClientTabBarRoute> {

    private let appRouter: UnownedRouter<AppRoute>

    private let homeRouter: StrongRouter<ClientHomeRoute>
    private let coursesRouter: StrongRouter<ClientCoursesRoute>
    private let examsRouter: StrongRouter<ClientExamsRoute>
    private let profileRouter: StrongRouter<ClientProfileRoute>

    convenience init(appRouter: UnownedRouter<AppRoute>) {

        let homeCoordinator = ClientHomeCoordinator(appRouter: appRouter)

        let homeButton = UITabBarItem(
        title: "Башкы бет",
        image: UIImage(systemName: "house"),
        selectedImage: UIImage(systemName: "house.fill"))

        homeCoordinator.rootViewController.tabBarItem = homeButton

        let coursesCoordinator = ClientCoursesCoordinator(appRouter: appRouter)

        let coursesButton = UITabBarItem(
        title: "Сабактар",
        image: UIImage(systemName: "books.vertical"),
        selectedImage: UIImage(systemName: "books.vertical.fill"))

        coursesCoordinator.rootViewController.tabBarItem = coursesButton

        let examsCoordinator = ClientExamsCoordinator(appRouter: appRouter)

        let examsButton = UITabBarItem(
        title: "Сынамык",
        image: UIImage(systemName: "graduationcap"),
        selectedImage: UIImage(systemName: "graduationcap.fill"))

        examsCoordinator.rootViewController.tabBarItem = examsButton

        let profileCoordinator = ClientProfileCoordinator(appRouter: appRouter)

        let profileButton = UITabBarItem(
        title: "Аккаунт",
        image: UIImage(systemName: "gearshape"),
        selectedImage: UIImage(systemName: "gearshape.fill"))

        profileCoordinator.rootViewController.tabBarItem = profileButton

        coursesCoordinator.rootViewController.tabBarItem = coursesButton

        self.init(
            homeRouter: homeCoordinator.strongRouter,
            coursesRouter: coursesCoordinator.strongRouter,
            examsRouter: examsCoordinator.strongRouter,
            profileRouter: profileCoordinator.strongRouter,

            appRouter: appRouter
        )
    }

    init(
        homeRouter: StrongRouter<ClientHomeRoute>,
        coursesRouter: StrongRouter<ClientCoursesRoute>,
        examsRouter: StrongRouter<ClientExamsRoute>,
        profileRouter: StrongRouter<ClientProfileRoute>,
        appRouter: UnownedRouter<AppRoute>
    ) {
        self.homeRouter = homeRouter
        self.coursesRouter = coursesRouter
        self.examsRouter = examsRouter
        self.profileRouter = profileRouter
        self.appRouter = appRouter

        super.init(
            rootViewController: ClientTabBarController(),
            tabs: [homeRouter, coursesRouter, examsRouter, profileRouter],
            select: homeRouter
        )
    }

    // MARK: Overrides

    override func prepareTransition(for route: ClientTabBarRoute) -> TabBarTransition {
        switch route {
        case .home:
            return .select(homeRouter)
        case .courses:
            return .select(coursesRouter)
        case .exams:
            return .select(examsRouter)
        case .profile:
            return .select(profileRouter)
        }
    }
}
