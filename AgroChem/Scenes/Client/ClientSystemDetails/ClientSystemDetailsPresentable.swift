//
//  ClientSystemDetailsPresentable.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 15/4/24.
//

import UIKit
import SnapKit

final class ClientSystemDetailsPresentable: BaseView {

    private let systemDescription: UILabel = {
        let label = UILabel()
        label.text = "Kompleksnoe reshenie dla zashity goroha v techeniye vsego perioda rosta"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    override func onConfigureView() {
        backgroundColor = .white
    }

    override func onAddSubviews() {
        addSubviews(systemDescription)
    }

    override func onSetupConstraints() {

        systemDescription.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(15)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
    }
}
