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

    var pushToLesson = CurrentValueSubject<String, Never>("")
    private var lessons: [String] = ["Математика", "Окуу жана түшүнүү", "Химия"]

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
            make.edges.equalToSuperview()
        }
    }
}

extension ClientCoursesPresentable: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: ClientCoursesLessonCell = tableView.dequeue(for: indexPath)
        cell.configure(name: lessons[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        pushToLesson.send(lessons[indexPath.row])
    }
}
