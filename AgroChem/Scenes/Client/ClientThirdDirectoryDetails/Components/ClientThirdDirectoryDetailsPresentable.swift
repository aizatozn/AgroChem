//
//  ClientThirdDirectoryDetailsPresentable.swift
//  AgroChem
//
//  Created by Aizat Ozbekova on 27/4/24.
//

import UIKit
import SnapKit

final class ClientThirdDirectoryDetailsPresentable: BaseView {

    var directories: [ClientThirdDirectoryModel] = [] {
        didSet {
            directoryCollectionView.reloadData()
//            print(directories.count)
        }
    }

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
    }

    override func onAddSubviews() {
        addSubviews(directoryCollectionView)
    }

    override func onSetupConstraints() {

        directoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension ClientThirdDirectoryDetailsPresentable: UICollectionViewDelegate,
                                             UICollectionViewDataSource,
                                             UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        directories.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ClientThirdDirectoryDetailsCell = collectionView.dequeue(for: indexPath)
        cell.configure(model: directories[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      let model = directories[indexPath.item]

      let expectedWidth = collectionView.frame.width - 30

      let cell = ClientThirdDirectoryDetailsCell(frame: .zero)
      cell.configure(model: model)

      cell.layoutIfNeeded()
        let size = cell.systemLayoutSizeFitting(
            CGSize(width: expectedWidth,
                   height: CGFloat.greatestFiniteMagnitude), withHorizontalFittingPriority: .required,
                        verticalFittingPriority: .fittingSizeLevel)

        let height = size.height + 10

      return CGSize(width: expectedWidth, height: height)
    }
}
