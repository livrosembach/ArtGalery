//
//  ColectionCell.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 06/05/26.
//

import UIKit

final class ArtCell: UICollectionView {
    
    static let  reuseIdentifier = "ArtCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 16
        v.layer.masksToBounds = true
        return v
    }()
    
    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .white
        return iv
    }()
    
    private let titleLabel: UILabel = {
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            l.textColor = .white
            l.numberOfLines = 1
            return l
        }()
     
        private let subtitleLabel: UILabel = {
            let l = UILabel()
            l.translatesAutoresizingMaskIntoConstraints = false
            l.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            l.textColor = UIColor.white.withAlphaComponent(0.75)
            l.numberOfLines = 1
            return l
        }()
}
