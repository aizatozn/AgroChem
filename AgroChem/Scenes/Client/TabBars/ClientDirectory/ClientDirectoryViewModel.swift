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
    let bolezniDirectories: [ClientDirectoryModel] = [
        ClientDirectoryModel(image: "bolez1",
                             name: "Альтернариоз подсолнечника",
                             nameInEnglish: "Alternaria spp."),
        ClientDirectoryModel(image: "bolez2",
                             name: "Альтернариоз рапса",
                             nameInEnglish: "Alternaria brassicae Sacc, A. brassicicola Wilts."),
        ClientDirectoryModel(image: "bolez3",
                             name: "Альтернариоз сои ",
                             nameInEnglish: "Alternaria tenuis Nees"),
        ClientDirectoryModel(image: "sras4",
                             name: "Альтернариоз томата",
                             nameInEnglish: "Alternaria solani Sorauer. (=Macrosporium solani Ell.et Mart.)"),
        ClientDirectoryModel(image: "sras5",
                             name: "Антракноз гороха",
                             nameInEnglish: "Colletotrichum pisi Pat."),
        ClientDirectoryModel(image: "sras6",
                             name: "Амброзия трехраздельная",
                             nameInEnglish: "Ambrosia trifida"),
        ClientDirectoryModel(image: "sras7",
                             name: "Аметистка голубая",
                             nameInEnglish: "Amethystea caerulea L.")
    ]
    let vrediteliDirectories: [ClientDirectoryModel] = [
        ClientDirectoryModel(image: "vred1",
                             name: "Акациевая ложнощитовка",
                             nameInEnglish: "Parthenolecanium corni"),
        ClientDirectoryModel(image: "vred2",
                             name: "Акациевая огневка",
                             nameInEnglish: "Etiella zenckeneila"),
        ClientDirectoryModel(image: "vred3",
                             name: "Амбарная моль",
                             nameInEnglish: "Nemapogon granella"),
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
    let cultureDirectories: [ClientDirectoryModel] = [
        ClientDirectoryModel(image: "culture1",
                             name: "Абрикос обыкновенный",
                             nameInEnglish: "Prunus armeniaca L."),
        ClientDirectoryModel(image: "culture2",
                             name: "Айва",
                             nameInEnglish: "Cydonia"),
        ClientDirectoryModel(image: "culture3",
                             name: "Алыча",
                             nameInEnglish: "Prunus cerasifera Ehrh."),
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
    let deistDirectories: [ClientSecondDirectoryModel] = [
        ClientSecondDirectoryModel(
                             name: "2,4-Д (2-этилгексиловый эфир)",
                             nameInEnglish: "2,4-D (2-ethylhexyl)",
                             content: "2-этилгексиловый эфир",
                             description: "Пестицид, гербицид. Применяется в составе различных препаратов против двудольных сорняков"),
        ClientSecondDirectoryModel(
                             name: "Азимсульфурон",
                             nameInEnglish: "Azimsulfuron",
                             content: "1-(4,6-диметоксипиримидин-2-ил)-3-[1- метил-4-(2-метил-2Н-тетразол-5-ил)- "
                             + "пиразол-5-илсульфонил] мочевина",
                             description: "Prunus armeniaca L."),
        ClientSecondDirectoryModel(
                             name: "Абрикос обыкновенный",
                             nameInEnglish: "Prunus armeniaca L.",
                             content: "Prunus armeniaca L.",
                             description: "Prunus armeniaca L."),
        ClientSecondDirectoryModel(
                             name: "Абрикос обыкновенный",
                             nameInEnglish: "Prunus armeniaca L.",
                             content: "Prunus armeniaca L.",
                             description: "Prunus armeniaca L."),
        ClientSecondDirectoryModel(
                             name: "Абрикос обыкновенный",
                             nameInEnglish: "Prunus armeniaca L.",
                             content: "Prunus armeniaca L.",
                             description: "Prunus armeniaca L."),
        ClientSecondDirectoryModel(
                             name: "Абрикос обыкновенный",
                             nameInEnglish: "Prunus armeniaca L.",
                             content: "Prunus armeniaca L.",
                             description: "Prunus armeniaca L."),
        ClientSecondDirectoryModel(
                             name: "Абрикос обыкновенный",
                             nameInEnglish: "Prunus armeniaca L.",
                             content: "Prunus armeniaca L.",
                             description: "Prunus armeniaca L.")
    ]
//    let terminDirectories: [ClientSecondDirectoryModel] = [
//        ClientSecondDirectoryModel(
//                             name: "2,4-Д (2-этилгексиловый эфир)",
//                             nameInEnglish: "2,4-D (2-ethylhexyl)",
//                             content: "2-этилгексиловый эфир",
//                             description: "Пестицид, гербицид. Применяется в составе различных препаратов против двудольных сорняков"),

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
                if directory == "Сорные растения" {
                    self.router?.trigger(
                    .directoryDetails(title: directory,
                     directories: sorniyeDirectories))
                } else if directory == "Болезни культур" {
                    self.router?.trigger(
                    .directoryDetails(title: directory,
                     directories: bolezniDirectories))
                } else if directory == "Вредители" {
                    self.router?.trigger(
                    .directoryDetails(title: directory,
                     directories: vrediteliDirectories))
                } else if directory == "Культурные растения" {
                    self.router?.trigger(
                    .directoryDetails(title: directory,
                     directories: cultureDirectories))
                } else if directory == "Действующие вещества" {
                    self.router?.trigger(
                    .secondDirectoryDetails(title: directory,
                     directories: deistDirectories))
                }
//                    else if directory == "Термины" {
//                    self.router?.trigger(
//                    .directoryDetails(title: directory,
//                     directories: cultureDirectories))
//                }
            }
            .store(in: &cancellables)
    }
}
