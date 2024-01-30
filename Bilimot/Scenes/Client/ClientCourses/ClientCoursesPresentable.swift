//
//  ClientCoursesPresentable.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import SnapKit

final class ClientCoursesPresentable: BaseView {

    let clientCoursesLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 100)
        label.textColor = UIColor.red
        return label
    }()

    let clientCoursesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tap counter", for: .normal)
        button.setTitleColor(.green, for: .normal)
        return button
    }()

    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next controller", for: .normal)
        button.setTitleColor(.green, for: .normal)
        return button
    }()

    override func onConfigureView() {
        backgroundColor = .gray
    }

    override func onAddSubviews() {
        addSubviews(clientCoursesLabel, clientCoursesButton, nextButton)
    }

    override func onSetupConstraints() {

        clientCoursesLabel.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.centerX.equalToSuperview()
        }

        clientCoursesButton.snp.makeConstraints { make in
            make.top.equalTo(clientCoursesLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }

        nextButton.snp.makeConstraints { make in
            make.top.equalTo(clientCoursesButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
}
