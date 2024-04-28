//
//  ClientSystemDetailsPresentable.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 15/4/24.
//

import UIKit
import SnapKit

class Section {
    let title: String
    let options: [String]
    var isOpened: Bool = false

    init(title: String,
         options: [String],
         isOpened: Bool = false
    ) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}

final class ClientSystemDetailsPresentable: BaseView {

     private var sections = [
         Section(title: "Section 1", options: [1, 2, 3].compactMap({return "Cell \($0)" })),
         Section(title: "Section 2", options: [1, 2, 3].compactMap({return "Cell \($0)" })),
         Section(title: "Section 3", options: [1, 2, 3].compactMap({return "Cell \($0)" })),
         Section(title: "Section 4", options: [1, 2, 3].compactMap({return "Cell \($0)" }))
     ]

    private let systemDescription: UILabel = {
        let label = UILabel()
        label.text = "Kompleksnoe reshenie dla zashity goroha v techeniye vsego perioda rosta"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 80
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

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
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]

        if section.isOpened {
            return section.options.count + 1
        }
        else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ClientSystemDetailsCell = tableView.dequeue(for: indexPath)
        cell.backgroundColor = .clear

        if indexPath.row == 0 {
            cell.configure(model: ClientSystemsModel(image: "12", name: "Gerbiry"))
//            cell.textLabel?.text = sections[indexPath.section].title
        }
        else {
            cell.configure(model: ClientSystemsModel(image: "13", name: "Aizat"))
            cell.backgroundColor = .yellow
//            cell.textLabel?.text = sections[indexPath.section].options[indexPath.row - 1]
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        }
        else {
            print("tapped sub cell")
        }
    }
}
