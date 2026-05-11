//
//  HomeViewController.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 05/05/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    let viewModel = HomeViewModel()
    var filteredObras: [ObraDeArte] = []
    let searchController = UISearchController(searchResultsController: nil)
    var isSearching: Bool {
        let hasText = !(searchController.searchBar.text ?? "").isEmpty
        return searchController.isActive && hasText
    }
    var currentObras: [ObraDeArte] {
        isSearching ? filteredObras : viewModel.obras
    }
    
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.collectionView.dataSource = self
        homeView.collectionView.delegate = self
        view.backgroundColor = .systemBackground
        title = "Galeria"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = AppColors.accent
        setupSearch()
    }
    
    func goToDetails(obra: ObraDeArte) {
        let detailVC = DetailViewController()
        detailVC.setup(obra: obra)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    private func setupSearch() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar por nome"
        searchController.searchBar.autocapitalizationType = .words
        searchController.searchBar.tintColor = AppColors.accent
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
}







