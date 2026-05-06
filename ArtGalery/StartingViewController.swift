//
//  StartingViewController.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 05/05/26.
//

import UIKit

class StartingViewController: UIViewController {

    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        buildHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}

extension StartingViewController: ViewCode {
    func buildHierarchy() {
        view.addSubview(label)
    }

    func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
        label.text = "Hello ViewCode"
        label.textColor = .blue
    }
}

