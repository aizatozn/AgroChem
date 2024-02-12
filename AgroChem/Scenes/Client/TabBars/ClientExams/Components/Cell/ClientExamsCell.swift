//
//  ClientExamsCell.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 12/2/24.
//

import Foundation
import UIKit

final class ClientExamsCell: BaseCVCell {

    private let symbolImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        return imageView
    }()

    private let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override func onCreate() {
        layer.cornerRadius = 10
        backgroundColor = .red

        onAddSubviews()
        onSetupConstraints()
    }

    private func onAddSubviews() {
        contentView.addSubview(symbolImageView)
        contentView.addSubview(textLabel)
    }

    private func onSetupConstraints() {

        symbolImageView.snp.makeConstraints { make in
            make.centerX.equalTo(contentView.snp.centerX)
            make.centerY.equalTo(contentView.snp.centerY).offset(-10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }

        textLabel.snp.makeConstraints { make in
            make.top.equalTo(symbolImageView.snp.bottom).offset(5)
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(contentView.snp.trailing)
        }

    }

    func configure(symbolName: String, text: String) {
        symbolImageView.image = UIImage(systemName: symbolName)
        textLabel.text = text
    }
}
