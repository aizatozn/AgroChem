//
//  ClientExamsPresentable.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import SnapKit

final class ClientExamsPresentable: BaseView {

    let clientExamsLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 100)
        label.textColor = UIColor.red
        return label
    }()

    let clientExamsButton: UIButton = {
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
        backgroundColor = .blue
    }

    override func onAddSubviews() {
        addSubviews(clientExamsLabel, clientExamsButton, nextButton)
    }

    override func onSetupConstraints() {

        clientExamsLabel.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.centerX.equalToSuperview()
        }

        clientExamsButton.snp.makeConstraints { make in
            make.top.equalTo(clientExamsLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }

        nextButton.snp.makeConstraints { make in
            make.top.equalTo(clientExamsButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
}
