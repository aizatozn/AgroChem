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

    var pushToLesson = CurrentValueSubject<Int, Never>(0)
    private var lessons: [String] = ["Математика", "Критикалык ой жүгүртүү", "Химия", "Кеңештер", "Видео чыгарылыштар"]

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.sectionHeaderHeight = 50
        return table
    }()

    override func onConfigureView() {
        backgroundColor = .white
        view.backgroundColor = UIColor(patternImage: UIImage(named: "katalog_background")!)
    }

    override func onAddSubviews() {
        addSubview(tableView)
    }

    override func onSetupConstraints() {

        tableView.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
    }
}

extension ClientCoursesPresentable: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        lessons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: ClientCoursesCell = tableView.dequeue(for: indexPath)
        cell.configure(name: lessons[indexPath.section])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        pushToLesson.send(indexPath.section)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let footerView =
        UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 10))
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 10 : 0
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView =
        UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 10))
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        10
    }
}
