//
//  ClientSystemDetailsData.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 5/5/24.
//

import UIKit

final class ClientSystemDetailsData {

    static let bobData: [SystemCategories] = [
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "10",
                                                  name: "Гербициды",
                                                  color: .systemRed),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Тристар, КС",
                                   subName: "Прометрин, 500 г/л",
                                   faza: "faza",
                                   subFaza: "посев",
                                   norma: "norma",
                                   subNorma: "2.5 - 3.5 л/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Сапфир, ВРК",
                                   subName: "Имазетапир, 100 г/л",
                                   faza: "faza",
                                   subFaza: "с посев по 2-й тройной лист",
                                   norma: "norma",
                                   subNorma: "0.5 - 0.75 л/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Илот, ВР",
                                   subName: "Имазамокс, 40 г/л",
                                   faza: "faza",
                                   subFaza: "1-й тройной лист",
                                   norma: "norma",
                                   subNorma: "0.75 - 1 л/га",
                                   color: .systemRed),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Гербикс, ВК",
                                   subName: "МЦПА, 500 г/л",
                                   faza: "faza",
                                   subFaza: "с 1-й тройной лист по 2-й тройной лист",
                                   norma: "norma",
                                   subNorma: "0.5 - 0.8 л/га",
                                   color: .systemRed)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "10",
                                                  name: "Инсектициды",
                                                  color: .systemBlue),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Аккорд, КЭ",
                                   subName: "Альфа-циперметрин, 100 г/л",
                                   faza: "faza",
                                   subFaza: "c начало бутонизации по формирование бобов",
                                   norma: "norma",
                                   subNorma: "0.1 л/га",
                                   color: .systemBlue)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "10",
                                                  name: "Минеральные удобрения",
                                                  color: .systemGreen),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "АгроМинерал",
                                   subName: "Стручковые и Бобовые",
                                   faza: "faza",
                                   subFaza: "2-й тройной лист",
                                   norma: "norma",
                                   subNorma: "2 л/га",
                                   color: .systemGreen)
        ])
    ]

    static let zerData: [SystemCategories] = [
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "10",
                                                  name: "Протравители семян",
                                                  color: .purple),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Грандсил Ультра, КС",
                                   subName: "Прометрин, 500 г/л",
                                   faza: "faza",
                                   subFaza: "посев",
                                   norma: "norma",
                                   subNorma: "2.5 - 3.5 л/га",
                                   color: .purple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Сапфир, ВРК",
                                   subName: "Имазетапир, 100 г/л",
                                   faza: "faza",
                                   subFaza: "с посев по 2-й тройной лист",
                                   norma: "norma",
                                   subNorma: "0.5 - 0.75 л/га",
                                   color: .purple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Илот, ВР",
                                   subName: "Имазамокс, 40 г/л",
                                   faza: "faza",
                                   subFaza: "1-й тройной лист",
                                   norma: "norma",
                                   subNorma: "0.75 - 1 л/га",
                                   color: .purple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Гербикс, ВК",
                                   subName: "МЦПА, 500 г/л",
                                   faza: "faza",
                                   subFaza: "с 1-й тройной лист по 2-й тройной лист",
                                   norma: "norma",
                                   subNorma: "0.5 - 0.8 л/га",
                                   color: .purple)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "10",
                                                  name: "Гербициды",
                                                  color: .systemBlue),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Аккорд, КЭ",
                                   subName: "Альфа-циперметрин, 100 г/л",
                                   faza: "faza",
                                   subFaza: "c начало бутонизации по формирование бобов",
                                   norma: "norma",
                                   subNorma: "0.1 л/га",
                                   color: .systemBlue)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "10",
                                                  name: "Фунгициды",
                                                  color: .systemBlue),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Аккорд, КЭ",
                                   subName: "Альфа-циперметрин, 100 г/л",
                                   faza: "faza",
                                   subFaza: "c начало бутонизации по формирование бобов",
                                   norma: "norma",
                                   subNorma: "0.1 л/га",
                                   color: .systemBlue)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "10",
                                                  name: "Минеральные удобрения",
                                                  color: .systemGreen),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "АгроМинерал",
                                   subName: "Стручковые и Бобовые",
                                   faza: "faza",
                                   subFaza: "2-й тройной лист",
                                   norma: "norma",
                                   subNorma: "2 л/га",
                                   color: .systemGreen)
        ])
    ]

    static let karData: [SystemCategories] = [
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "10",
                                                  name: "Протравители семян",
                                                  color: .purple),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Грандсил Ультра, КС",
                                   subName: "Прометрин, 500 г/л",
                                   faza: "faza",
                                   subFaza: "посев",
                                   norma: "norma",
                                   subNorma: "2.5 - 3.5 л/га",
                                   color: .purple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Сапфир, ВРК",
                                   subName: "Имазетапир, 100 г/л",
                                   faza: "faza",
                                   subFaza: "с посев по 2-й тройной лист",
                                   norma: "norma",
                                   subNorma: "0.5 - 0.75 л/га",
                                   color: .purple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Илот, ВР",
                                   subName: "Имазамокс, 40 г/л",
                                   faza: "faza",
                                   subFaza: "1-й тройной лист",
                                   norma: "norma",
                                   subNorma: "0.75 - 1 л/га",
                                   color: .purple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Гербикс, ВК",
                                   subName: "МЦПА, 500 г/л",
                                   faza: "faza",
                                   subFaza: "с 1-й тройной лист по 2-й тройной лист",
                                   norma: "norma",
                                   subNorma: "0.5 - 0.8 л/га",
                                   color: .purple)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "10",
                                                  name: "Гербициды",
                                                  color: .systemBlue),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Аккорд, КЭ",
                                   subName: "Альфа-циперметрин, 100 г/л",
                                   faza: "faza",
                                   subFaza: "c начало бутонизации по формирование бобов",
                                   norma: "norma",
                                   subNorma: "0.1 л/га",
                                   color: .systemBlue)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "10",
                                                  name: "Фунгициды",
                                                  color: .systemBlue),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Аккорд, КЭ",
                                   subName: "Альфа-циперметрин, 100 г/л",
                                   faza: "faza",
                                   subFaza: "c начало бутонизации по формирование бобов",
                                   norma: "norma",
                                   subNorma: "0.1 л/га",
                                   color: .systemBlue)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "10",
                                                  name: "Минеральные удобрения",
                                                  color: .systemGreen),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "АгроМинерал",
                                   subName: "Стручковые и Бобовые",
                                   faza: "faza",
                                   subFaza: "2-й тройной лист",
                                   norma: "norma",
                                   subNorma: "2 л/га",
                                   color: .systemGreen)
        ])
    ]

    static let kukData: [SystemCategories] = [
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "10",
                                                  name: "Протравители семян",
                                                  color: .purple),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Грандсил Ультра, КС",
                                   subName: "Прометрин, 500 г/л",
                                   faza: "faza",
                                   subFaza: "посев",
                                   norma: "norma",
                                   subNorma: "2.5 - 3.5 л/га",
                                   color: .purple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Сапфир, ВРК",
                                   subName: "Имазетапир, 100 г/л",
                                   faza: "faza",
                                   subFaza: "с посев по 2-й тройной лист",
                                   norma: "norma",
                                   subNorma: "0.5 - 0.75 л/га",
                                   color: .purple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Илот, ВР",
                                   subName: "Имазамокс, 40 г/л",
                                   faza: "faza",
                                   subFaza: "1-й тройной лист",
                                   norma: "norma",
                                   subNorma: "0.75 - 1 л/га",
                                   color: .purple),
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Гербикс, ВК",
                                   subName: "МЦПА, 500 г/л",
                                   faza: "faza",
                                   subFaza: "с 1-й тройной лист по 2-й тройной лист",
                                   norma: "norma",
                                   subNorma: "0.5 - 0.8 л/га",
                                   color: .purple)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "10",
                                                  name: "Гербициды",
                                                  color: .systemBlue),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Аккорд, КЭ",
                                   subName: "Альфа-циперметрин, 100 г/л",
                                   faza: "faza",
                                   subFaza: "c начало бутонизации по формирование бобов",
                                   norma: "norma",
                                   subNorma: "0.1 л/га",
                                   color: .systemBlue)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "10",
                                                  name: "Фунгициды",
                                                  color: .systemBlue),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "Аккорд, КЭ",
                                   subName: "Альфа-циперметрин, 100 г/л",
                                   faza: "faza",
                                   subFaza: "c начало бутонизации по формирование бобов",
                                   norma: "norma",
                                   subNorma: "0.1 л/га",
                                   color: .systemBlue)
        ]),
        SystemCategories(
        systemCategory: ClientSystemCategoryModel(image: "10",
                                                  name: "Минеральные удобрения",
                                                  color: .systemGreen),
        categoryDetails: [
        ClientCategoryDetailsModel(image: "k4",
                                   name: "АгроМинерал",
                                   subName: "Стручковые и Бобовые",
                                   faza: "faza",
                                   subFaza: "2-й тройной лист",
                                   norma: "norma",
                                   subNorma: "2 л/га",
                                   color: .systemGreen)
        ])
    ]
}
