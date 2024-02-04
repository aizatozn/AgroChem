//
//  ClientCoursesViewModel.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import Combine
import Foundation
import XCoordinator

protocol ClientCoursesViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientCoursesRoute>? { get set }
    var counter: CurrentValueSubject<Int, Never> { get set }
    var nextRoute: PassthroughSubject<Void, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
    var pushToLesson: CurrentValueSubject<Int, Never> { get set }
}

final class ClientCoursesViewModelImpl: BaseVM<UnownedRouter<ClientCoursesRoute>>,
                                     ClientCoursesViewModel {

    var counter = CurrentValueSubject<Int, Never>(0)
    var nextRoute = PassthroughSubject<Void, Never>()
    var pushToLesson = CurrentValueSubject<Int, Never>(0)

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
            .sink { [weak self] index in
                if index == 0 {
                    self?.router?.trigger(.math(nameOfLesson: "Математика курстары"))
                } else if index == 1 {
                    self?.router?.trigger(.criticalThinking(nameOfLesson: "Критикалык ой жүгүртүү"))
                } else if index == 2 {
                    self?.router?.trigger(.сhemistry(nameOfLesson: "Химия курстары"))
                } else if index == 3 {
                    self?.router?.trigger(.advises(nameOfLesson: "ЖРТ кеңештер, кесип тандоо жана ЖОЖдор"))
                } else if index == 4 {
                    self?.router?.trigger(.practiceTestSolutions(nameOfLesson: "Сынамык тесттин чыгарылыштары"))
                }

                print(index)
            }
            .store(in: &cancellables)
    }
}
