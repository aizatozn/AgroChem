//
//  ClientHomePresentable.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import SnapKit
import Combine

final class ClientHomePresentable: BaseView {

    private let newsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 15
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .yellow
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        collectionView.showsHorizontalScrollIndicator = false
        layout.scrollDirection = .horizontal
        return collectionView
    }()

    private let data = [("camera.macro", "Сорные растения"), ("ladybug", "Вредители"),
                        ("percent", "Действующие вещества"), ("ant", "Болезни культур"),
                        ("leaf", "Культурные растения"), ("character.book.closed", "Термины")]

    override func onConfigureView() {
        backgroundColor = .white
        newsCollectionView.dataSource = self
        newsCollectionView.delegate = self
    }

    override func onAddSubviews() {
        addSubviews(newsCollectionView)
    }

    override func onSetupConstraints() {

        newsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(150)
        }
    }
}

extension ClientHomePresentable: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        let cell: ClientHomeCell = collectionView.dequeue(for: indexPath)

        let (symbolName, text) = data[indexPath.item]
        cell.configure(symbolName: symbolName, text: text)

        return cell
    }
}

extension ClientHomePresentable: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 1.4, height: 150)
    }
}
