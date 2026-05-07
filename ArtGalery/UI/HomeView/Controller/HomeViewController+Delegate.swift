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
        // Access the selected item from the controller's data source instead of the collection view's dataSource
        let obra = viewModel.obras[indexPath.item]
        goToDetails(obra: obra)
    }
}
