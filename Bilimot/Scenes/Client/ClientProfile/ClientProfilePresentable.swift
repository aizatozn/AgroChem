//
//  ClientProfilePresentable.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import SnapKit

final class ClientProfilePresentable: BaseView {

    let clientProfileLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 100)
        label.textColor = UIColor.red
        return label
    }()

    let clientProfileButton: UIButton = {
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
        backgroundColor = .systemBackground
    }

    override func onAddSubviews() {
        addSubviews(clientProfileLabel, clientProfileButton, nextButton)
    }

    override func onSetupConstraints() {

        clientProfileLabel.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.centerX.equalToSuperview()
        }

        clientProfileButton.snp.makeConstraints { make in
            make.top.equalTo(clientProfileLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }

        nextButton.snp.makeConstraints { make in
            make.top.equalTo(clientProfileButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
}
