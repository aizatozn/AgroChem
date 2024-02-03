//
//  ClientChemistryLessonViewModel.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 2/3/24.
//

import Combine
import Foundation
import XCoordinator

protocol ClientChemistryLessonViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientCoursesRoute>? { get set }
    var counter: CurrentValueSubject<Int, Never> { get set }
    var nextRoute: PassthroughSubject<Void, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
    var pushToLesson: CurrentValueSubject<String, Never> { get set }
}

final class ClientChemistryLessonViewModelImpl: BaseVM<UnownedRouter<ClientCoursesRoute>>,
                                                ClientChemistryLessonViewModel {

    var counter = CurrentValueSubject<Int, Never>(0)
    var nextRoute = PassthroughSubject<Void, Never>()
    var pushToLesson = CurrentValueSubject<String, Never>("")

    private var networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        super.init()
    }

    override func onSubscribe() {

        nextRoute
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.router?.trigger(.next)
            }
            .store(in: &cancellables)

        pushToLesson
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] name in
                self?.router?.trigger(.сhemistry(nameOfLesson: name))
            }
            .store(in: &cancellables)
    }
}
