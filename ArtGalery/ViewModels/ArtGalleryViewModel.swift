//
//  ArtGalleryViewModel.swift
//  ArtGalery
//
//  Created on 06/05/26.
//

import Foundation

final class ArtGalleryViewModel {

    // MARK: - Properties

    private(set) var obras: [ObraDeArte] = []

    /// Closure chamada sempre que a lista de obras é atualizada.
    var onObrasUpdated: (() -> Void)?

    /// Número total de obras disponíveis.
    var numberOfItems: Int {
        return obras.count
    }

    // MARK: - Public Methods

    /// Retorna a obra de arte no índice especificado.
    func obra(at index: Int) -> ObraDeArte {
        return obras[index]
    }

    /// Carrega os dados de obras de arte.
    /// Em um cenário real, isso poderia vir de uma API ou banco de dados.
    func fetchObras() {
        obras = [
            ObraDeArte(
                titulo: "Mona Lisa",
                artista: "Leonardo da Vinci",
                ano: 1503,
                estilo: "Renascimento",
                imagemNome: "mona_lisa",
                descricao: "Retrato pintado por Leonardo da Vinci, considerado uma das obras mais famosas do mundo."
            ),
            ObraDeArte(
                titulo: "A Noite Estrelada",
                artista: "Vincent van Gogh",
                ano: 1889,
                estilo: "Pós-Impressionismo",
                imagemNome: "noite_estrelada",
                descricao: "Pintura a óleo que retrata a vista de uma janela do quarto de Van Gogh em Saint-Rémy-de-Provence."
            ),
            ObraDeArte(
                titulo: "O Grito",
                artista: "Edvard Munch",
                ano: 1893,
                estilo: "Expressionismo",
                imagemNome: "o_grito",
                descricao: "Obra icônica que representa uma figura angustiada contra um céu turbulento."
            ),
            ObraDeArte(
                titulo: "Abaporu",
                artista: "Tarsila do Amaral",
                ano: 1928,
                estilo: "Modernismo",
                imagemNome: "abaporu",
                descricao: "Obra que inspirou o Movimento Antropofágico, marco do modernismo brasileiro."
            ),
            ObraDeArte(
                titulo: "Guernica",
                artista: "Pablo Picasso",
                ano: 1937,
                estilo: "Cubismo",
                imagemNome: "guernica",
                descricao: "Mural que retrata os horrores do bombardeio de Guernica durante a Guerra Civil Espanhola."
            ),
            ObraDeArte(
                titulo: "A Persistência da Memória",
                artista: "Salvador Dalí",
                ano: 1931,
                estilo: "Surrealismo",
                imagemNome: "persistencia_memoria",
                descricao: "Pintura surrealista conhecida por seus relógios derretidos em uma paisagem onírica."
            ),
            ObraDeArte(
                titulo: "Moça com Brinco de Pérola",
                artista: "Johannes Vermeer",
                ano: 1665,
                estilo: "Barroco",
                imagemNome: "moca_brinco_perola",
                descricao: "Pintura frequentemente referida como a 'Mona Lisa Holandesa'."
            ),
            ObraDeArte(
                titulo: "O Nascimento de Vênus",
                artista: "Sandro Botticelli",
                ano: 1485,
                estilo: "Renascimento",
                imagemNome: "nascimento_venus",
                descricao: "Obra-prima do Renascimento que retrata a deusa Vênus emergindo do mar."
            )
        ]
        onObrasUpdated?()
    }
}
