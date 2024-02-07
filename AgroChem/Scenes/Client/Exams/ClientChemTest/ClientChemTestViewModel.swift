//
//  ClientChemTestViewModel.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 4/2/24.
//

import Combine
import Foundation
import XCoordinator

protocol ClientChemTestViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientExamsRoute>? { get set }
    var counter: CurrentValueSubject<Int, Never> { get set }
    var nextRoute: PassthroughSubject<Void, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
    var pushToLesson: CurrentValueSubject<String, Never> { get set }
}

final class ClientChemTestViewModelImpl: BaseVM<UnownedRouter<ClientExamsRoute>>,
                                                ClientChemTestViewModel {

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
                self?.router?.trigger(.сhemTest(nameOfLesson: name))
            }
            .store(in: &cancellables)
    }
}
