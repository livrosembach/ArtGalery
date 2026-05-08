//
//  ObraDeArteCell.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 07/05/26.
//

import UIKit

class ObraDeArteCell: UICollectionViewCell {
    static let identifier = "ObraDeArteCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildHierarchy()
        setupConstraints()
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(obra: ObraDeArte) {
        titleLabel.text = obra.titulo
        obraImageView.image = UIImage(named: obra.imagemNome)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        obraImageView.image = nil
        titleLabel.text = nil
    }
    
    private func setupCell() {
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        obraImageView.layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.12
        layer.shadowRadius = 12
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.masksToBounds = false
    }
    
    private lazy var obraImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        return view
    }()

    private let gradientOverlay: CAGradientLayer = {
        let gradient = CAGradientLayer()
        
        gradient.colors = [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.88).cgColor
        ]
        
        gradient.locations = [0.35, 1.0]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        return gradient
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.font = .preferredFont(forTextStyle: .headline)
        view.adjustsFontForContentSizeCategory = true
        view.numberOfLines = 2
        view.textColor = .white
        return view
    }()
    
    func buildHierarchy() {
        contentView.addSubview(obraImageView)
        contentView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        obraImageView.layer.cornerRadius = 16
        obraImageView.layer.masksToBounds = true
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        gradientOverlay.frame = contentView.bounds
        gradientOverlay.cornerRadius = contentView.layer.cornerRadius
        CATransaction.commit()
        
        if gradientOverlay.superlayer !== contentView.layer {
            contentView.layer.insertSublayer(gradientOverlay, above: obraImageView.layer)
        }
        contentView.bringSubviewToFront(titleLabel)
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            obraImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            obraImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            obraImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            obraImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
        ])
    }
}

