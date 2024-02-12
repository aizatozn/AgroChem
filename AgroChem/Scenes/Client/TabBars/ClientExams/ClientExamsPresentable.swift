//
//  ClientExamsPresentable.swift
//  Bilimot
//
//  Created by Aizat Ozbekova on 30/1/24.
//

import UIKit
import SnapKit
import Combine

final class ClientExamsPresentable: BaseView {

    private let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .vertical
       layout.minimumLineSpacing = 10
       layout.minimumInteritemSpacing = 10
       let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       collectionView.translatesAutoresizingMaskIntoConstraints = false
       collectionView.backgroundColor = .white
       return collectionView
    }()

    private let data = [("camera.macro", "Сорные растения"), ("ladybug", "Вредители"),
                        ("percent", "Действующие вещества"), ("ant", "Болезни культур"),
                        ("leaf", "Культурные растения"), ("character.book.closed", "Термины")]

    override func onConfigureView() {
        backgroundColor = .systemBackground

       collectionView.dataSource = self
       collectionView.delegate = self

       collectionView.register(ClientExamsCell.self, forCellWithReuseIdentifier: "Cell")

    }

    override func onAddSubviews() {
        view.addSubview(collectionView)
    }

    override func onSetupConstraints() {
        collectionView.backgroundColor = .yellow
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension ClientExamsPresentable: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        let cell: ClientExamsCell = collectionView.dequeue(for: indexPath)

        let (symbolName, text) = data[indexPath.item]
        cell.configure(symbolName: symbolName, text: text)

        return cell
    }
}

extension ClientExamsPresentable: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2.3, height: 80)
    }
}
