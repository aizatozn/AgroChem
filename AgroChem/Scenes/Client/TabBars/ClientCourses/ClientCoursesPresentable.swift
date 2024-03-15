//
//  ClientCoursesPresentable.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import SnapKit
import Combine

final class ClientCoursesPresentable: BaseView {

    private var medicines: [ClientCoursesModel] = [
        ClientCoursesModel(image: "medcine", name: "First", subName: "sub first", description: "description 1"),
        ClientCoursesModel(image: "medcine", name: "Second", subName: "sub first", description: "description 2"),
        ClientCoursesModel(image: "newsImage1", name: "First", subName: "sub first", description: "description 3"),
        ClientCoursesModel(image: "medcine", name: "Fourth", subName: "sub first", description: "description 4")
    ]

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        return table
    }()

    override func onConfigureView() {
        backgroundColor = .white
    }

    override func onAddSubviews() {
        addSubview(tableView)
    }

    override func onSetupConstraints() {

        tableView.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
    }
}

extension ClientCoursesPresentable: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        medicines.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: ClientCoursesCell = tableView.dequeue(for: indexPath)
        cell.configure(model: medicines[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
