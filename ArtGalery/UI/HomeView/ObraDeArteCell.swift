//
//  ObraDeArteCell.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 07/05/26.
//

import UIKit

class ObraDeArteCell: UICollectionViewCell {
    static let identifier = "ObraDeArteCell"
    
    func setup(obra: ObraDeArte) {
        titleLabel.text = obra.titulo
        obraImageView.image = UIImage(named: obra.imagemNome)
        buildHierarchy()
        setupConstraints()
    }
    
    private(set) lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        view.numberOfLines = 2
        return view
    }()
    
    private(set) lazy var obraImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    func buildHierarchy() {
        contentView.addSubview(obraImageView)
        contentView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            obraImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            obraImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            obraImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            obraImageView.heightAnchor.constraint(equalToConstant: 180),
            
            titleLabel.topAnchor.constraint(equalTo: obraImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
    }
}
