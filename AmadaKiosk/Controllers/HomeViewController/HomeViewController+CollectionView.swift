//
//  HomeViewController+CollectionView.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/5/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TapCollectionViewCell
        let model = models[indexPath.row]
        cell.text = model.title ?? ""

        if let imagePath = model.imagePath {
            cell.imageView.download(from: imagePath)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // let cellWidth: CGFloat = (view.frame.width - 140) / 3 // 3 cells per row
        // let cellWidth: CGFloat = (view.frame.width - 150) / 4
        let cellsPerRow: CGFloat = 4
        let cellWidth: CGFloat = (collectionView.frame.width - (cellsPerRow * 10)) / cellsPerRow
        let cellHeight: CGFloat = cellWidth
        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        guard let url = model.url else { return }
        webViewController.urlString = url
        navigationController?.pushViewController(webViewController, animated: true)
    }

}
