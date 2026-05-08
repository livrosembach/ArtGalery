//
//  HomeViewController.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 05/05/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    let viewModel = HomeViewModel()
    
    
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
    }
    
    func goToDetails(obra: ObraDeArte) {
        let detailVC = DetailViewController()
        detailVC.setup(obra: obra)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}







