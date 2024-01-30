//
//  ViewModulesAssembly.swift
//  AgroLab
//
//  Created by Aizat Ozbekova on 27/1/24.
//

import Swinject
import XCoordinator

final class ViewModulesAssembly: Assembly {

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
    }
}
