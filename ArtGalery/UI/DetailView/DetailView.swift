//
//  DetailView.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 07/05/26.
//

import UIKit

class DetailView: UIView{
    private let scrollView = UIScrollView()
    private let contentStack = UIStackView()
    private let metaStack = UIStackView()
    private let styleRowStack = UIStackView()
    private let stylePillView = UIView()
    private let metaSpacer = UIView()
    private let styleRowSpacer = UIView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        tintColor = AppColors.accent
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private(set) lazy var obraImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        return view
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.font = .preferredFont(forTextStyle: .title2)
        view.adjustsFontForContentSizeCategory = true
        view.numberOfLines = 2
        view.textColor = .label
        return view
    }()
    
    private(set) lazy var artistNameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .subheadline)
        view.adjustsFontForContentSizeCategory = true
        view.textColor = .secondaryLabel
        return view
    }()
    
    private(set) lazy var createdAtLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .caption1)
        view.adjustsFontForContentSizeCategory = true
        view.textColor = .tertiaryLabel
        view.textAlignment = .right
        return view
    }()
    
    private(set) lazy var artisticStyleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .caption1)
        view.adjustsFontForContentSizeCategory = true
        view.textColor = .white
        view.textAlignment = .center
        return view
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .preferredFont(forTextStyle: .body)
        view.adjustsFontForContentSizeCategory = true
        view.textColor = .secondaryLabel
        view.numberOfLines = 0
        return view
    }()
    
    private(set) lazy var shareObraButton: UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Compartilhar obra", for: .normal)
        view.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        view.tintColor = .white
        view.backgroundColor = AppColors.accent
        view.layer.cornerRadius = 14
        view.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        view.titleLabel?.adjustsFontForContentSizeCategory = true
        view.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        view.imageEdgeInsets = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 4)
        return view
    }()
    
    func setup(obra: ObraDeArte){
        titleLabel.text = obra.titulo
        obraImageView.image = UIImage(named: obra.imagemNome)
        artistNameLabel.text = obra.artista
        createdAtLabel.text = String(obra.ano)
        artisticStyleLabel.text = obra.estilo
        descriptionLabel.text = obra.descricao
    }
    
    func setupSubviews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        addSubview(scrollView)
        
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        contentStack.axis = .vertical
        contentStack.alignment = .fill
        contentStack.spacing = 12
        scrollView.addSubview(contentStack)
        
        metaStack.axis = .horizontal
        metaStack.alignment = .center
        metaStack.spacing = 8
        metaSpacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        metaSpacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        createdAtLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        styleRowStack.axis = .horizontal
        styleRowStack.alignment = .center
        styleRowStack.spacing = 8
        styleRowSpacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        styleRowSpacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        styleRowStack.addArrangedSubview(stylePillView)
        styleRowStack.addArrangedSubview(styleRowSpacer)
        
        stylePillView.translatesAutoresizingMaskIntoConstraints = false
        stylePillView.backgroundColor = AppColors.accent
        stylePillView.layer.cornerRadius = 12
        stylePillView.clipsToBounds = true
        stylePillView.addSubview(artisticStyleLabel)
        
        metaStack.addArrangedSubview(artistNameLabel)
        metaStack.addArrangedSubview(metaSpacer)
        metaStack.addArrangedSubview(createdAtLabel)
        
        contentStack.addArrangedSubview(obraImageView)
        contentStack.setCustomSpacing(16, after: obraImageView)
        contentStack.addArrangedSubview(titleLabel)
        contentStack.addArrangedSubview(metaStack)
        contentStack.addArrangedSubview(styleRowStack)
        contentStack.addArrangedSubview(descriptionLabel)
        contentStack.setCustomSpacing(20, after: descriptionLabel)
        contentStack.addArrangedSubview(shareObraButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            contentStack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 16),
            contentStack.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor, constant: 16),
            contentStack.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -16),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -24),
            
            obraImageView.heightAnchor.constraint(equalTo: obraImageView.widthAnchor, multiplier: 0.68),
            shareObraButton.heightAnchor.constraint(equalToConstant: 50),
            
            artisticStyleLabel.topAnchor.constraint(equalTo: stylePillView.topAnchor, constant: 6),
            artisticStyleLabel.bottomAnchor.constraint(equalTo: stylePillView.bottomAnchor, constant: -6),
            artisticStyleLabel.leadingAnchor.constraint(equalTo: stylePillView.leadingAnchor, constant: 12),
            artisticStyleLabel.trailingAnchor.constraint(equalTo: stylePillView.trailingAnchor, constant: -12)
        ])
    }
}
