//
//  HomeViewController+Delegate.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 07/05/26.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchResultsUpdating {
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
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let cell = collectionView.cellForItem(at: indexPath) as? ObraDeArteCell else {
            let obra = currentObras[indexPath.item]
            goToDetails(obra: obra)
            return
        }
        let obra = currentObras[indexPath.item]
        animateSelection(cell: cell) { [weak self] in
            self?.goToDetails(obra: obra)
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let query = searchController.searchBar.text ?? ""
        let normalizedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        if normalizedQuery.isEmpty {
            filteredObras = []
        } else {
            filteredObras = viewModel.obras.filter { obra in
                obra.titulo.range(of: normalizedQuery, options: .caseInsensitive) != nil
            }
        }
        homeView.collectionView.reloadData()
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
    
    func animateSelection(cell: UICollectionViewCell, completion: @escaping () -> Void) {
        UIView.animate(
            withDuration: 0.12,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                cell.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
            },
            completion: { _ in
                UIView.animate(
                    withDuration: 0.18,
                    delay: 0,
                    options: [.curveEaseInOut],
                    animations: {
                        cell.transform = .identity
                    },
                    completion: { _ in
                        completion()
                    }
                )
            }
        )
    }
}
