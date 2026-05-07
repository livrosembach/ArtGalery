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
        homeView.collectionView.dataSource = self
        homeView.collectionView.delegate = self
    }
    
    func goToDetails(obra: ObraDeArte) {
        let detailVC = DetailViewController()
        detailVC.setup(obra: obra)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}







