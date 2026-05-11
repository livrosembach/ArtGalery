//
//  DetailViewController.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 07/05/26.
//

import UIKit

class DetailViewController: UIViewController{
    private let detailView = DetailView()
    private var obra: ObraDeArte?
    
    override func loadView() {
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        detailView.shareObraButton.addTarget(
            self,
            action: #selector(didTapShare),
            for: .touchUpInside
        )
    }
    
    func setup(obra: ObraDeArte) {
        self.obra = obra
        detailView.setup(obra: obra)
    }
    
    @objc private func didTapShare() {
        guard let obra else { return }
        let message = "\(obra.titulo) — \(obra.artista). Descubra mais sobre os artistas de Curitiba!"
        let activityVC = UIActivityViewController(activityItems: [message], applicationActivities: nil)
        if let popover = activityVC.popoverPresentationController {
            popover.sourceView = detailView.shareObraButton
            popover.sourceRect = detailView.shareObraButton.bounds
        }
        present(activityVC, animated: true)
    }
}
