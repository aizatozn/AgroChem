//
//  ClientSystemsViewModel.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 8/4/24.
//

import Combine
import Foundation
import XCoordinator

protocol ClientSystemsViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientHomeRoute>? { get set }
    var counter: CurrentValueSubject<Int, Never> { get set }
    var nextRoute: PassthroughSubject<Void, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
    var pushToLesson: CurrentValueSubject<Int, Never> { get set }
}

final class ClientSystemsViewModelImpl: BaseVM<UnownedRouter<ClientHomeRoute>>,
                                        ClientSystemsViewModel {

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
//                if index == 0 {
//                    self?.router?.trigger(.mathTest(nameOfLesson: "Математика сынамык тесттери"))
//                } else if index == 1 {
//                    self?.router?.trigger(.mathMainTest(nameOfLesson: "Негизги тест - математика"))
//                } else if index == 2 {
//                    self?.router?.trigger(.сhemTest(nameOfLesson: "Химия тесттери"))
//                }

                print(index)
            }
            .store(in: &cancellables)
    }
}
