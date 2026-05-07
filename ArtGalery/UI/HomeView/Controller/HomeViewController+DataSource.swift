//
//  DataSource.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 07/05/26.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(
        _: UICollectionView,
        numberOfItemsInSection _: Int
    ) -> Int {
        viewModel.obras.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ObraDeArteCell.identifier,
            for: indexPath
        ) as? ObraDeArteCell else { fatalError("Could not dequeue ObraDeArteCell") }
        
        cell.setup(obra: viewModel.obras[indexPath.row])
        
        return cell
    }
    
}
