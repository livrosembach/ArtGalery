//
//  ArtDetailViewController.swift
//  ArtGalery
//
//  Created on 06/05/26.
//

import UIKit

final class ArtDetailViewController: UIViewController {

    // MARK: - Properties

    private let obra: ObraDeArte

    // MARK: - UI Components

    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.showsVerticalScrollIndicator = false
        return sv
    }()

    private let contentView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let artImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .systemGray5
        iv.layer.cornerRadius = 16
        iv.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return iv
    }()

    private let titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        l.textColor = .label
        l.numberOfLines = 0
        return l
    }()

    private let artistLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        l.textColor = .secondaryLabel
        return l
    }()

    private let yearStyleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        l.textColor = .tertiaryLabel
        return l
    }()

    private let dividerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .separator
        return v
    }()

    private let descriptionLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        l.textColor = .label
        l.numberOfLines = 0
        return l
    }()

    // MARK: - Init

    init(obra: ObraDeArte) {
        self.obra = obra
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureContent()
    }

    // MARK: - Configuration

    private func configureContent() {
        titleLabel.text = obra.titulo
        artistLabel.text = obra.artista
        yearStyleLabel.text = "\(obra.ano) • \(obra.estilo)"
        descriptionLabel.text = obra.descricao
        artImageView.image = UIImage(named: obra.imagemNome)
    }
}

// MARK: - ViewCode

extension ArtDetailViewController: ViewCode {
    func buildHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(artImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(artistLabel)
        contentView.addSubview(yearStyleLabel)
        contentView.addSubview(dividerView)
        contentView.addSubview(descriptionLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            // ScrollView
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // ContentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            // Image
            artImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            artImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            artImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            artImageView.heightAnchor.constraint(equalToConstant: 320),

            // Title
            titleLabel.topAnchor.constraint(equalTo: artImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            // Artist
            artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            artistLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            artistLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            // Year + Style
            yearStyleLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 4),
            yearStyleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            yearStyleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            // Divider
            dividerView.topAnchor.constraint(equalTo: yearStyleLabel.bottomAnchor, constant: 16),
            dividerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dividerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            dividerView.heightAnchor.constraint(equalToConstant: 1),

            // Description
            descriptionLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
        ])
    }

    func setupAdditionalConfiguration() {
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .never
    }
}
