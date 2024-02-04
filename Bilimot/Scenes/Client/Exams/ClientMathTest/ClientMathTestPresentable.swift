//
//  ClientMathTestPresentable.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 4/2/24.
//

import UIKit
import SnapKit
import Combine

final class ClientMathTestPresentable: BaseView {

    var pushToLesson = CurrentValueSubject<String, Never>("")
    private var lessons: [String] = ["Математика сынамык тест - АЛЬФА",
                                     "Математика сынамык тест - БЕТА",
                                     "Математика сынамык тест - ГАММА",
                                     "Математика сынамык тест - ТЕТА"]

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none

        return table
    }()

    override func onConfigureView() {
        backgroundColor = .systemBackground

    }

    override func onAddSubviews() {
        addSubview(tableView)
    }

    override func onSetupConstraints() {
        tableView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
    }
}

extension ClientMathTestPresentable: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        lessons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: ClientChemistryLessonCell = tableView.dequeue(for: indexPath)
        cell.configure(name: lessons[indexPath.section])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        pushToLesson.send(lessons[indexPath.section])
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 10))
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}
