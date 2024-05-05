//
//  ClientSystemDetailsData.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 4/5/24.
//

import Foundation

struct ClientSystemСategoryModel {

    let image: String
    let name: String
    let nameDescription: String
    let faza: String
    let fazaDescription: String
    let norma: String
    let normaDescription: String
}

final class ClientSystemDetailsData {

    static let bobMedicines: [Daary] = [
        Daary(category: ClientSystemsModel(image: "12",
                                           name: "Гербициды"),
              medicines: [
                ClientCatalogModel(image: "12",
                                   name: "Гербициды1",
                                   subName: "Гербициды subName",
                                   description: "Гербициды description"),
                ClientCatalogModel(image: "12",
                                   name: "Гербициды2",
                                   subName: "Гербициды subName",
                                   description: "Гербициды description"),
                ClientCatalogModel(image: "12",
                                   name: "Гербициды3",
                                   subName: "Гербициды subName",
                                   description: "Гербициды description")
              ]),
        Daary(category: ClientSystemsModel(image: "12",
                                           name: "Зерноаве"),
              medicines: [
                ClientCatalogModel(image: "12",
                                   name: "Гербициды1",
                                   subName: "Гербициды subName",
                                   description: "Гербициды description"),
                ClientCatalogModel(image: "12",
                                   name: "Гербициды1",
                                   subName: "Гербициды subName",
                                   description: "Гербициды description"),
                ClientCatalogModel(image: "12",
                                   name: "Гербициды1",
                                   subName: "Гербициды subName",
                                   description: "Гербициды description")
              ])
    ]

    static let zerno: [Daary] = [
        Daary(
              category: ClientSystemsModel(image: "12",
                                           name: "Гербициды"),
              medicines: [
                ClientCatalogModel(image: "12",
                                   name: "Гербициды1",
                                   subName: "Гербициды subName",
                                   description: "Гербициды description"),
                ClientCatalogModel(image: "12",
                                   name: "Гербициды1",
                                   subName: "Гербициды subName",
                                   description: "Гербициды description"),
                ClientCatalogModel(image: "12",
                                   name: "Гербициды1",
                                   subName: "Гербициды subName",
                                   description: "Гербициды description")
              ])
    ]

    static let bobGerbitsidy: [ClientSystemsModel] = [
        ClientSystemsModel(image: "11",
                           name: "Гербициды")
    ]
    static let bobInsektitsidy: [ClientSystemsModel] = [
        ClientSystemsModel(image: "11",
                           name: "Инсектициды")
    ]
    static let bobMineral: [ClientSystemsModel] = [
        ClientSystemsModel(image: "11",
                           name: "Минеральные удобрения")
    ]

    static let bobGerb: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "Тристар",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5"),
        ClientSystemСategoryModel(image: "11",
                                  name: "Сапфир",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let bobIns: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "Аккорд",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let bobMin: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let zerProt: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let zerGerb: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let zerFung: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let zerIns: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let zerMin: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let karProt: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let karGerb: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let karIns: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let kukProt: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let kukGerb: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let lenProt: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let lenGerb: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let podProt: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let podGerb: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let podFung: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let podDes: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let podMin: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let rapsProt: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let rapsGerb: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let rapsFung: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let rapsIns: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let rapsDes: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let rapsMin: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let svekGerb: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let svekFung: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
    static let svekIns: [ClientSystemСategoryModel] = [
        ClientSystemСategoryModel(image: "11",
                                  name: "АгроМинерал",
                                  nameDescription: "Прометрин",
                                  faza: "Фаза культуры",
                                  fazaDescription: "посев",
                                  norma: "Норма расхода",
                                  normaDescription: "2.5 - 3.5")
    ]
}
