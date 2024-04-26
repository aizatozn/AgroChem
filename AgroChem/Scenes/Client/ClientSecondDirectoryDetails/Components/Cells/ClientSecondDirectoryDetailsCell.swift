//
//  ClientSecondDirectoryDetailsCell.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 26/4/24.
//

import UIKit
import SnapKit

final class ClientSecondDirectoryDetailsCell: BaseCVCell {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()

    private let nameInEnglishLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 19, weight: .regular)
        return label
    }()

    private let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .light)
        return label
    }()

    override func onCreate() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor

        onAddSubviews()
        onSetUpConstraints()
    }

    private func onAddSubviews() {
        addSubviews(nameLabel, nameInEnglishLabel, contentLabel, descriptionLabel)
    }

    private func onSetUpConstraints() {

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.leading.equalTo(12)
            make.trailing.equalTo(-12)
        }

        nameInEnglishLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.leading.equalTo(12)
            make.trailing.equalTo(-12)
        }

        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(nameInEnglishLabel.snp.bottom).offset(6)
            make.leading.equalTo(12)
            make.trailing.equalTo(-12)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(6)
            make.leading.equalTo(12)
            make.trailing.equalTo(-12)
            make.bottom.equalTo(-12)
        }
    }

    func configure(model: ClientSecondDirectoryModel) {
        nameLabel.text = model.name
        nameInEnglishLabel.text = model.nameInEnglish
        contentLabel.text = model.content // Use the new 'content' property
        descriptionLabel.text = model.description
    }
}
