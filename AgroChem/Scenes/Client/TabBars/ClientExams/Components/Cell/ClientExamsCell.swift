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
        return imageView
    }()

    private let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()

    override func onCreate() {
        backgroundColor = .red

        onAddSubviews()
        onSetupConstraints()
    }

    private func onAddSubviews() {
        contentView.addSubview(symbolImageView)
        contentView.addSubview(textLabel)
    }

    private func onSetupConstraints() {
    
        NSLayoutConstraint.activate([
            symbolImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            symbolImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -20),

            textLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 5),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    func configure(symbolName: String, text: String) {
        symbolImageView.image = UIImage(systemName: symbolName)
        textLabel.text = text
    }
}
