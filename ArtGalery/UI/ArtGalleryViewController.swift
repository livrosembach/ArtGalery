//
//  ArtGalleryViewController.swift
//  ArtGalery
//
//  Created on 06/05/26.
//

import UIKit

final class ArtGalleryViewController: UIViewController {

    // MARK: - Properties

    private let galleryView = ArtGalleryView()
    private let viewModel = ArtGalleryViewModel()

    // MARK: - Lifecycle

    override func loadView() {
        view = galleryView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
        bindViewModel()
        viewModel.fetchObras()
    }

    // MARK: - Setup

    private func setupNavigationBar() {
        title = "Galeria de Arte"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupCollectionView() {
        galleryView.collectionView.dataSource = self
        galleryView.collectionView.delegate = self
    }

    // MARK: - Binding

    private func bindViewModel() {
        viewModel.onObrasUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.galleryView.collectionView.reloadData()
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension ArtGalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ArtCell.reuseIdentifier,
            for: indexPath
        ) as? ArtCell else {
            return UICollectionViewCell()
        }

        let obra = viewModel.obra(at: indexPath.item)
        cell.configure(with: obra)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ArtGalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let padding: CGFloat = 16 * 2 + 16 // left + right insets + interitem spacing
        let availableWidth = collectionView.bounds.width - padding
        let cellWidth = availableWidth / 2
        let cellHeight = cellWidth * 1.4 // aspect ratio for art cards
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

// MARK: - UICollectionViewDelegate

extension ArtGalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let obra = viewModel.obra(at: indexPath.item)
        let detailVC = ArtDetailViewController(obra: obra)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
