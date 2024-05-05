//
//  ClientSystemDetailsPresentable.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 15/4/24.
//

import UIKit
import SnapKit

final class ClientSystemDetailsPresentable: BaseView {

    private let systemDescription: UILabel = {
        let label = UILabel()
        label.text = "Комплексное решение для защиты гороха в течение всего периода роста"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    var data: [Daary] = [
        Daary(category: ClientSystemsModel(image: "10",
                                           name: "Гербициды"),
              medicines: [
                ClientCatalogModel(image: "k1",
                                   name: "Гербициды1",
                                   subName: "Мезотрион, 70 г/л + Никосульфурон, 40 г/л",
                                   description: "Послевсходовый гербицид для контроля многолетних, однолетних"
                                   + " злаковых и двудольных сорняков на кукурузе"),
                ClientCatalogModel(image: "k1",
                                   name: "Гербициды2",
                                   subName: "Мезотрион, 70 г/л + Никосульфурон, 40 г/л",
                                   description: "Послевсходовый гербицид для контроля многолетних, однолетних"
                                   + " злаковых и двудольных сорняков на кукурузе")
            ]),
        Daary(category: ClientSystemsModel(image: "10",
                                           name: "Инсектициды"),
              medicines: [
                ClientCatalogModel(image: "k1",
                                   name: "Инсектициды1",
                                   subName: "Мезотрион, 70 г/л + Никосульфурон, 40 г/л",
                                   description: "Послевсходовый гербицид для контроля многолетних, однолетних"
                                   + " злаковых и двудольных сорняков на кукурузе")
            ]),
        Daary(category: ClientSystemsModel(image: "10",
                                         name: "Минеральные удобрения"),
              medicines: [
                ClientCatalogModel(image: "k1",
                                   name: "Минеральные удобрения1",
                                   subName: "Мезотрион, 70 г/л + Никосульфурон, 40 г/л",
                                   description: "Послевсходовый гербицид для контроля многолетних, однолетних"
                                   + " злаковых и двудольных сорняков на кукурузе"),
                ClientCatalogModel(image: "k1",
                                   name: "Минеральные удобрения2",
                                   subName: "Мезотрион, 70 г/л + Никосульфурон, 40 г/л",
                                   description: "Послевсходовый гербицид для контроля многолетних, однолетних"
                                   + " злаковых и двудольных сорняков на кукурузе"),
                ClientCatalogModel(image: "k1",
                                   name: "Минеральные удобрения3",
                                   subName: "Мезотрион, 70 г/л + Никосульфурон, 40 г/л",
                                   description: "Послевсходовый гербицид для контроля многолетних, однолетних"
                                   + " злаковых и двудольных сорняков на кукурузе"),
                ClientCatalogModel(image: "k1",
                                   name: "Минеральные удобрения4",
                                   subName: "Мезотрион, 70 г/л + Никосульфурон, 40 г/л",
                                   description: "Послевсходовый гербицид для контроля многолетних, однолетних"
                                   + " злаковых и двудольных сорняков на кукурузе")
            ])
    ]

    override func onConfigureView() {
        backgroundColor = .white

        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        tableView.frame = view.bounds
    }

    override func onAddSubviews() {
        addSubviews(systemDescription, tableView)
    }

    override func onSetupConstraints() {

        systemDescription.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(systemDescription.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension ClientSystemDetailsPresentable: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = data[section]
        if currentSection.isExpanded {
            return currentSection.medicines.count + 1 // 1 for category cell
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.backgroundColor = .clear
        if indexPath.row == 0 {
            let categoryIndex = indexPath.section
            let cellModel = data[categoryIndex].category
            let cellInstance: ClientSystemDetailsCell = tableView.dequeue(for: indexPath)
            cellInstance.configure(model: cellModel)
            cell = cellInstance
        } else {
            let medicineIndex = indexPath.row - 1 // Adjust index to match array index
            let medicineModel = data[indexPath.section].medicines[medicineIndex]
            let cellInstance: ClientSystemDetailsSubCell = tableView.dequeue(for: indexPath)
            cellInstance.configure(model: medicineModel)
            cell = cellInstance
            cell.backgroundColor = .white
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            data[indexPath.section].isExpanded = !data[indexPath.section].isExpanded
            tableView.reloadSections([indexPath.section], with: .automatic) // Animate cell expansion/collapse
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 70
        }
        return UITableView.automaticDimension
    }

}
