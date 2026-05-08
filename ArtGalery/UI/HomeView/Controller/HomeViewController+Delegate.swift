//
//  HomeViewController+Delegate.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 07/05/26.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let sectionInset = sectionInsets
        let columns: CGFloat = traitCollection.horizontalSizeClass == .regular ? 2 : 1
        let totalSpacing = sectionInset.left + sectionInset.right + (columns - 1) * interItemSpacing
        let availableWidth = collectionView.bounds.width - totalSpacing
        let itemWidth = floor(availableWidth / columns)
        let itemHeight = itemWidth * 0.64
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        sectionInsets
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        lineSpacing
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        interItemSpacing
    }
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        // Access the selected item from the controller's data source instead of the collection view's dataSource
        let obra = viewModel.obras[indexPath.item]
        goToDetails(obra: obra)
    }
}

private extension HomeViewController {
    var sectionInsets: UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 16, bottom: 24, right: 16)
    }
    
    var lineSpacing: CGFloat {
        14
    }
    
    var interItemSpacing: CGFloat {
        12
    }
}
