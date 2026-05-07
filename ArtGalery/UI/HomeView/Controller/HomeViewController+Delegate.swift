//
//  HomeViewController+Delegate.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 07/05/26.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print("TOUCHED ITEM Nº \(indexPath.row)")
    }
}
