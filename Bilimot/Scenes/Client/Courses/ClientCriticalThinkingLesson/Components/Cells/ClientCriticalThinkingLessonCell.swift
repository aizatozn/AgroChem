//
//  ClientCriticalThinkingCell.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 2/3/24.
//

import UIKit
import Combine

final class ClientCriticalThinkingLessonCell: BaseTVCell {

    private let lessonLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    override func onCreate() {
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor

        onAddSubviews()
        onSetUpConstraints()
    }

    private func onAddSubviews() {
        addSubview(lessonLabel)
    }

    private func onSetUpConstraints() {

        lessonLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
        }
    }

    func configure(name: String) {
        lessonLabel.text = name
    }
}
