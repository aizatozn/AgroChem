//
//  ClientSystemDetailsViewModel.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 15/4/24.
//

import Combine
import Foundation
import XCoordinator

protocol ClientSystemDetailsViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientHomeRoute>? { get set }
    var counter: CurrentValueSubject<Int, Never> { get set }
    var nextRoute: PassthroughSubject<Void, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
}

final class ClientSystemDetailsViewModelImpl: BaseVM<UnownedRouter<ClientHomeRoute>>,
                                     ClientSystemDetailsViewModel {

    var counter = CurrentValueSubject<Int, Never>(0)
    var nextRoute = PassthroughSubject<Void, Never>()

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
    }
}
