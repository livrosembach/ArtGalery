//
//  DetailViewController.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 07/05/26.
//

import UIKit

class DetailViewController: UIViewController{
    private let detailView = DetailView()
//    let viewModel = HomeViewModel()
    
    override func loadView() {
        self.view = detailView
    }
    
    func setup(obra: ObraDeArte) {
        detailView.setup(obra: obra)
    }
}
