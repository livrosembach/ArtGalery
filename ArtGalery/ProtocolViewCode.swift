//
//  ProtocolViewCode.swift
//  ArtGalery
//
//  Created by Livia Rosembach Oliveira on 05/05/26.
//

protocol ViewCode {
    func buildHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
}

extension ViewCode {
    func setupView() {
        buildHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
