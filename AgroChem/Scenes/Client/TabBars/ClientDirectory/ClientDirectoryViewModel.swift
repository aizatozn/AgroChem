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
        ClientDirectoryModel(image: "image1",
                             name: "First direct",
                             nameInEnglish: "First english"),
        ClientDirectoryModel(image: "image2",
                             name: "Second direct",
                             nameInEnglish: "Second english"),
        ClientDirectoryModel(image: "image2",
                             name: "Third direct",
                             nameInEnglish: "Third english"),
        ClientDirectoryModel(image: "image3",
                             name: "Fourth direct",
                             nameInEnglish: "Fourth english"),
        ClientDirectoryModel(image: "image1",
                             name: "Fifth direct",
                             nameInEnglish: "Fifth english"),
        ClientDirectoryModel(image: "image4",
                             name: "Sixth direct",
                             nameInEnglish: "Sixth english"),
        ClientDirectoryModel(image: "image2",
                             name: "Seventh direct",
                             nameInEnglish: "Seventh english")
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
                print("--- bul jakty kara: \(directory)")
//                if directory = "sornuye rasteniye" {
//                    sorniyeDirectories
//                } /// switch case ti koldon
                self.router?.trigger(.directoryDetails(title: directory,
                                                       directories: sorniyeDirectories))
            }
            .store(in: &cancellables)
    }
}
