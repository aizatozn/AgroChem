//
//  ClientDirectoryViewModel.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import Combine
import Foundation
import XCoordinator

protocol ClientDirectoryViewModel: BaseVMProtocol {
    var router: UnownedRouter<ClientDirectoryRoute>? { get set }
    var counter: CurrentValueSubject<Int, Never> { get set }
    var nextRoute: PassthroughSubject<Void, Never> { get set }
    var cancellables: Set<AnyCancellable> { get set }
    var pushToLesson: CurrentValueSubject<Int, Never> { get set }
    var selectedDirectory: CurrentValueSubject<String?, Never> { get set }
}

final class ClientExamsViewModelImpl: BaseVM<UnownedRouter<ClientDirectoryRoute>>,
                                     ClientDirectoryViewModel {

    var counter = CurrentValueSubject<Int, Never>(0)
    var nextRoute = PassthroughSubject<Void, Never>()
    var pushToLesson = CurrentValueSubject<Int, Never>(0)
    var selectedDirectory = CurrentValueSubject<String?, Never>(nil)
    let sorniyeDirectories: [ClientDirectoryModel] = [
        ClientDirectoryModel(image: "sras1",
                             name: "Аистик цикутовый",
                             nameInEnglish: "Erodium cicutarium"),
        ClientDirectoryModel(image: "sras2",
                             name: "Акалифа южная",
                             nameInEnglish: "Acalypha autralis L."),
        ClientDirectoryModel(image: "sras3",
                             name: "Аксирис щирицевый",
                             nameInEnglish: "Axyris amaranthoides"),
        ClientDirectoryModel(image: "sras4",
                             name: "Амброзия голометельчатая",
                             nameInEnglish: "Ambrosia psilostachya"),
        ClientDirectoryModel(image: "sras5",
                             name: "Амброзия полыннолистная",
                             nameInEnglish: "Ambrosia artemisiifolia"),
        ClientDirectoryModel(image: "sras6",
                             name: "Амброзия трехраздельная",
                             nameInEnglish: "Ambrosia trifida"),
        ClientDirectoryModel(image: "sras7",
                             name: "Аметистка голубая",
                             nameInEnglish: "Amethystea caerulea L.")
    ]

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

        selectedDirectory
            .receive(on: DispatchQueue.main)
            .sink { [weak self] directory in
                guard let self = self, let directory = directory else { return }
                print("--- \(directory)")
//                if directory = "sornuye rasteniye" {
//                    sorniyeDirectories
//                } /// switch case ti koldon
                self.router?.trigger(.directoryDetails(title: directory,
                                                       directories: sorniyeDirectories))
            }
            .store(in: &cancellables)
    }
}
