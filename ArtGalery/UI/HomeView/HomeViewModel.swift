//
//  HomeViewModel.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 07/05/26.
//


final class HomeViewModel {
    private(set) var obras: [ObraDeArte] =
    [
        ObraDeArte(
            titulo: "Painel da Praça 19 de Dezembro",
            artista: "Poty Lazzarotto",
            ano: 1953,
            estilo: "Muralismo",
            imagemNome: "poty_praca_19",
            descricao: "Painel em azulejo que retrata a história e o desenvolvimento de Curitiba."
        ),
        ObraDeArte(
            titulo: "Murais do Teatro Guaíra",
            artista: "Poty Lazzarotto",
            ano: 1970,
            estilo: "Muralismo",
            imagemNome: "poty_guaira",
            descricao: "Conjunto de murais que representam aspectos culturais e sociais do Paraná."
        ),
        ObraDeArte(
            titulo: "Fundação de Curitiba",
            artista: "Theodoro de Bona",
            ano: 1941,
            estilo: "Pintura histórica",
            imagemNome: "fundacao_curitiba",
            descricao: "Obra que retrata a origem da cidade com forte influência acadêmica."
        ),
        ObraDeArte(
            titulo: "Tigre Esmagando a Cobra",
            artista: "João Turin",
            ano: 1927,
            estilo: "Escultura",
            imagemNome: "tigre_cobra",
            descricao: "Escultura simbólica ligada ao movimento paranista e à identidade regional."
        ),
        ObraDeArte(
            titulo: "Águia de Haia",
            artista: "João Turin",
            ano: 1928,
            estilo: "Escultura",
            imagemNome: "aguia_haia",
            descricao: "Obra que simboliza força e liberdade dentro do contexto paranista."
        ),
        ObraDeArte(
            titulo: "Torso do Trabalhador",
            artista: "Erbo Stenzel",
            ano: 1940,
            estilo: "Escultura moderna",
            imagemNome: "torso_trabalhador",
            descricao: "Representação da força do trabalhador com traços modernos."
        ),
        ObraDeArte(
            titulo: "Água pro Morro",
            artista: "Erbo Stenzel",
            ano: 1950,
            estilo: "Escultura",
            imagemNome: "agua_morro",
            descricao: "Escultura que representa questões sociais e o cotidiano urbano."
        ),
        ObraDeArte(
            titulo: "Litografia Sem Título",
            artista: "Denise Roman",
            ano: 2005,
            estilo: "Gravura",
            imagemNome: "denise_roman",
            descricao: "Obra em litografia com reconhecimento internacional pela técnica refinada."
        ),
        ObraDeArte(
            titulo: "Mural Urbano (Sem Título)",
            artista: "Rimon Guimarães",
            ano: 2018,
            estilo: "Street Art",
            imagemNome: "rimon_mural",
            descricao: "Mural contemporâneo com cores vibrantes e identidade brasileira."
        ),
        ObraDeArte(
            titulo: "Composição Abstrata",
            artista: "Violeta Franco",
            ano: 1980,
            estilo: "Arte moderna",
            imagemNome: "violeta_franco",
            descricao: "Pintura com elementos abstratos presente em acervos de Curitiba."
        )
    ]
}

