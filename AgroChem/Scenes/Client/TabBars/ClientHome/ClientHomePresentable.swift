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
        layout.minimumInteritemSpacing = 15
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        layout.scrollDirection = .horizontal
        return collectionView
    }()

    private let data = [("camera.macro", "Сорные растения"), ("ladybug", "Вредители"),
                        ("percent", "Действующие вещества"), ("ant", "Болезни культур"),
                        ("leaf", "Культурные растения"), ("character.book.closed", "Термины")]

    override func onConfigureView() {
        newsCollectionView.dataSource = self
        newsCollectionView.delegate = self

        newsCollectionView.register(ClientHomeCell.self, forCellWithReuseIdentifier: "Cell")}

    override func onAddSubviews() {
        view.addSubview(newsCollectionView)
    }

    override func onSetupConstraints() {

        newsCollectionView.backgroundColor = .yellow
        newsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
//            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(90)
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
            return CGSize(width: UIScreen.main.bounds.width / 1.4, height: 130)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
               return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
            }
    }
