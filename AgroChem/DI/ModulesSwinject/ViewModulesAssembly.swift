//
//  ViewModulesAssembly.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import Swinject
import XCoordinator

final class ViewModulesAssembly: Assembly {

    // swiftlint:disable function_body_length
    public func assemble(container: Swinject.Container) {

        container.register((any GreetingViewModel).self) {
            GreetingViewModelImpl.init(
                networkManager: $0.resolve(NetworkManager.self)!
            )
        }

        container.register((any ClientHomeViewModel).self) {
            ClientHomeViewModelImpl.init(
                networkManager: $0.resolve(NetworkManager.self)!
            )
        }

        container.register((any ClientCoursesViewModel).self) {
            ClientCoursesViewModelImpl.init(
                networkManager: $0.resolve(NetworkManager.self)!
            )
        }

        container.register((any ClientExamsViewModel).self) {
            ClientExamsViewModelImpl.init(
                networkManager: $0.resolve(NetworkManager.self)!
            )
        }

        container.register((any ClientProfileViewModel).self) {
            ClientProfileViewModelImpl.init(
                networkManager: $0.resolve(NetworkManager.self)!
            )
        }

        container.register((any ClientMathLessonViewModel).self) {
            ClientMathLessonViewModelImpl.init(
                networkManager: $0.resolve(NetworkManager.self)!
            )
        }

        container.register((any ClientCriticalThinkingLessonViewModel).self) {
            ClientCriticalThinkingLesViewModelImpl.init(
                networkManager: $0.resolve(NetworkManager.self)!
            )
        }

        container.register((any ClientChemistryLessonViewModel).self) {
            ClientChemistryLessonViewModelImpl.init(
                networkManager: $0.resolve(NetworkManager.self)!
            )
        }

        container.register((any ClientAdvisesLessonViewModel).self) {
            ClientAdvisesLessonViewModelImpl.init(
                networkManager: $0.resolve(NetworkManager.self)!
            )
        }

        container.register((any ClientTestSolitionsLessonViewModel).self) {
            ClientTestSolitionsLessonViewModelImpl.init(
                networkManager: $0.resolve(NetworkManager.self)!
            )
        }

        container.register((any ClientMathTestViewModel).self) {
            ClientMathTestViewModelImpl.init(
                networkManager: $0.resolve(NetworkManager.self)!
            )
        }

        container.register((any ClientMainMathTestViewModel).self) {
            ClientMainMathTestViewModelImpl.init(
                networkManager: $0.resolve(NetworkManager.self)!
            )
        }

        container.register((any ClientChemTestViewModel).self) {
            ClientChemTestViewModelImpl.init(
                networkManager: $0.resolve(NetworkManager.self)!
            )
        }
    } // swiftlint:enable function_body_length
}
