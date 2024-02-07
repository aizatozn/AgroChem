//
//  ClientHomePresentable.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import SnapKit

final class ClientHomePresentable: BaseView {

    private let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "home_background")
        image.contentMode = .scaleAspectFill
        return image
    }()

    private let bilimotImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bilimot")
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.5)
        view.layer.cornerRadius = 25
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.masksToBounds = true
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowRadius = 10
        view.clipsToBounds = true
        view.layer.rasterizationScale = 5
        return view
    }()

    override func onConfigureView() {
        backgroundColor = .systemBackground
        whiteView.layer.shadowPath = UIBezierPath(roundedRect: whiteView.bounds, cornerRadius: 10).cgPath

    }

    override func onAddSubviews() {
        addSubviews(backgroundImageView, bilimotImageView, whiteView)
    }

    override func onSetupConstraints() {

        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }

        bilimotImageView.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.leading.equalTo(-40)
            make.height.equalTo(180)
            make.width.equalTo(250)
        }

        whiteView.snp.makeConstraints { make in
            make.top.equalTo(bilimotImageView.snp.bottom).offset(-30)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(200)
        }
    }
}
