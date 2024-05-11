//
//  ClientDirectoryDetailsPresentable.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 26/4/24.
//

import UIKit
import SnapKit

final class ClientSecondDirectoryDetailsPresentable: BaseView {

    var directories: [ClientSecondDirectoryModel] = [] {
        didSet {
            directoryCollectionView.reloadData()
//            print(directories.count)
        }
    }

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    private let directoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 20, right: 0)
        return collectionView
    }()

    override func onConfigureView() {
        backgroundColor = .white
        directoryCollectionView.delegate = self
        directoryCollectionView.dataSource = self
        searchBar.delegate = self
    }

    override func onAddSubviews() {
        addSubviews(directoryCollectionView, searchBar)
    }

    override func onSetupConstraints() {

        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
        }

        directoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension ClientSecondDirectoryDetailsPresentable: UICollectionViewDelegate,
                                             UICollectionViewDataSource,
                                                   UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Фильтрация данных по поисковому запросу
        let filteredDirectories = directories.filter { directory in
            // Здесь вы можете настроить фильтрацию по требованию.
            // Например, используйте directory.name или directory.nameInEnglish
            return directory.name.contains(searchText)
        }

        func collectionView(_ collectionView: UICollectionView,
                            numberOfItemsInSection section: Int) -> Int {
            directories.count
        }

        func collectionView(_ collectionView: UICollectionView,
                            cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell: ClientSecondDirectoryDetailsCell = collectionView.dequeue(for: indexPath)
            cell.configure(model: directories[indexPath.item])
            return cell
        }
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            let model = directories[indexPath.item]

            let expectedWidth = collectionView.frame.width - 30

            let cell = ClientSecondDirectoryDetailsCell(frame: .zero)
            cell.configure(model: model)

            cell.layoutIfNeeded()
            let size = cell.systemLayoutSizeFitting(
                CGSize(width: expectedWidth,
                       height: CGFloat.greatestFiniteMagnitude), withHorizontalFittingPriority: .required,
                verticalFittingPriority: .fittingSizeLevel)

            let height = size.height + 10

            return CGSize(width: expectedWidth, height: height)
        }
        directoryCollectionView.reloadData()
    }
}
