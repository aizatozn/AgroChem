//
//  ClientCatalogCell.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 1/2/24.
//

import UIKit
import SnapKit

final class ClientCatalogCell: BaseTVCell {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()

    override func onCreate() {
        onAddSubviews()
        onSetUpConstraints()
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }

    private func onAddSubviews() {
        addSubviews(nameLabel)
    }

    private func onSetUpConstraints() {

        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(15)
            make.trailing.equalTo(-12)
        }
    }

    func configure(model: ClientSystemCategoryModel) {
        nameLabel.text = model.name
        nameLabel.textColor = model.color
//        iconImageView.tintColor = model.color
    }
}
