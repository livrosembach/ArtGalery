//
//  ColectionCell.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 06/05/26.
//

import UIKit

final class ArtCell: UICollectionViewCell {

    static let reuseIdentifier = "ArtCell"

    // MARK: - UI Components

    private let containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.systemGray6
        v.layer.cornerRadius = 16
        v.layer.masksToBounds = true
        return v
    }()

    private let artImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .systemGray5
        return iv
    }()

    private let titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        l.textColor = .label
        l.numberOfLines = 2
        return l
    }()

    private let artistLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        l.textColor = .secondaryLabel
        l.numberOfLines = 1
        return l
    }()

    private let yearLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        l.textColor = .tertiaryLabel
        l.numberOfLines = 1
        return l
    }()

    private let styleTagView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.systemIndigo.withAlphaComponent(0.15)
        v.layer.cornerRadius = 8
        return v
    }()

    private let styleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        l.textColor = .systemIndigo
        l.numberOfLines = 1
        return l
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configuration

    func configure(with obra: ObraDeArte) {
        titleLabel.text = obra.titulo
        artistLabel.text = obra.artista
        yearLabel.text = "\(obra.ano)"
        styleLabel.text = obra.estilo
        artImageView.image = UIImage(named: obra.imagemNome)
    }
}

// MARK: - ViewCode

extension ArtCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubview(artImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(artistLabel)
        containerView.addSubview(yearLabel)
        containerView.addSubview(styleTagView)
        styleTagView.addSubview(styleLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Container
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            // Image (top portion of the card)
            artImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            artImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            artImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            artImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.6),

            // Title
            titleLabel.topAnchor.constraint(equalTo: artImageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),

            // Artist
            artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            artistLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            artistLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),

            // Year
            yearLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 4),
            yearLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),

            // Style Tag
            styleTagView.centerYAnchor.constraint(equalTo: yearLabel.centerYAnchor),
            styleTagView.leadingAnchor.constraint(equalTo: yearLabel.trailingAnchor, constant: 8),
            styleTagView.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -12),

            styleLabel.topAnchor.constraint(equalTo: styleTagView.topAnchor, constant: 3),
            styleLabel.bottomAnchor.constraint(equalTo: styleTagView.bottomAnchor, constant: -3),
            styleLabel.leadingAnchor.constraint(equalTo: styleTagView.leadingAnchor, constant: 8),
            styleLabel.trailingAnchor.constraint(equalTo: styleTagView.trailingAnchor, constant: -8),
        ])
    }

    func setupAdditionalConfiguration() {
        contentView.layer.cornerRadius = 16
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.1
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.shadowRadius = 8
        contentView.layer.masksToBounds = false
    }
}
