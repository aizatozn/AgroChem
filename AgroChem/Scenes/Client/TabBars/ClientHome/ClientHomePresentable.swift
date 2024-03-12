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

    private let data = [("camera.macro", "Сорные растения"), ("ladybug", "Вредители"),
                        ("percent", "Действующие вещества"), ("ant", "Болезни культур"),
                        ("leaf", "Культурные растения"), ("character.book.closed", "Термины")]

    private let actualData = [("camera.macro", "Сорные растения"), ("ladybug", "Вредители"),
                        ("percent", "Действующие вещества"), ("ant", "Болезни культур"),
                        ("leaf", "Культурные растения"), ("character.book.closed", "Термины")]

    private let catalogData = [("camera.macro", "Сорные растения"), ("ladybug", "Вредители"),
                        ("percent", "Действующие вещества"), ("ant", "Болезни культур"),
                        ("leaf", "Культурные растения"), ("character.book.closed", "Термины")]

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

    private let catalogCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .vertical
       layout.minimumLineSpacing = 15
       layout.minimumInteritemSpacing = 15
       let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       collectionView.translatesAutoresizingMaskIntoConstraints = false
       collectionView.backgroundColor = .yellow
       return collectionView
    }()

    private let actualCollectionView: UICollectionView = {
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

    private let actualTitle: UILabel = {
        let label = UILabel()
        label.text = "Актуальные препараты"
        label.textColor = .black
        label.font = .systemFont(ofSize: 23, weight: .medium)
        return label
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func onConfigureView() {
        backgroundColor = .white

        newsCollectionView.dataSource = self
        newsCollectionView.delegate = self
        catalogCollectionView.dataSource = self
        catalogCollectionView.delegate = self
        actualCollectionView.dataSource = self
        actualCollectionView.delegate = self
    }

    override func onAddSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubviews(newsCollectionView, catalogCollectionView,
                                actualTitle, actualCollectionView)
    }

    override func onSetupConstraints() {

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(scrollView).priority(.low)
        }

        newsCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(150)
        }

        catalogCollectionView.snp.makeConstraints { make in
            make.top.equalTo(newsCollectionView.snp.bottom).offset(30)
            make.leading.equalTo(25)
            make.trailing.equalTo(-25)
            make.height.equalTo(300)
        }

        actualTitle.snp.makeConstraints { make in
            make.top.equalTo(catalogCollectionView.snp.bottom).offset(30)
            make.leading.equalTo(15)
        }

        actualCollectionView.snp.makeConstraints { make in
            make.top.equalTo(actualTitle.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
    }
}

extension ClientHomePresentable: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if newsCollectionView == collectionView {
            return data.count
        } else if catalogCollectionView == collectionView {
            return catalogData.count
        } else {
            return actualData.count
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {

        if newsCollectionView == collectionView {
            let cell: ClientHomeCell = collectionView.dequeue(for: indexPath)

            let (symbolName, text) = data[indexPath.item]
            cell.configure(symbolName: symbolName, text: text)
            return cell
        } else if catalogCollectionView == collectionView {
            let cell: ClientDirectoryCell = collectionView.dequeue(for: indexPath)

            let (symbolName, text) = data[indexPath.item]
            cell.configure(symbolName: symbolName, text: text)

            return cell
        } else {
            let cell: ClientHomeCell = collectionView.dequeue(for: indexPath)

            let (symbolName, text) = data[indexPath.item]
            cell.configure(symbolName: symbolName, text: text)
            return cell
        }
    }
}

extension ClientHomePresentable: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if newsCollectionView == collectionView {
            return CGSize(width: UIScreen.main.bounds.width / 1.4, height: 150)
        } else if catalogCollectionView == collectionView {
            return CGSize(width: UIScreen.main.bounds.width / 2.4, height: 90)
        } else {
            return CGSize(width: UIScreen.main.bounds.width / 1.1, height: 150)
        }
    }
}
