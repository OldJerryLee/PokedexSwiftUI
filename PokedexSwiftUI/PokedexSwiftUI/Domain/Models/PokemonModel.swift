//
//  PokemonModel.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Foundation

protocol PokemonModelProtocol {
    var id: Int { get }
    var image: URL? { get }
    var name: String { get }
}

struct PokemonModel: PokemonModelProtocol {

    // MARK: - Computed Properties
    var id: Int {
        PokemonNumberGenerator.generate(from: pokemonData.url?.absoluteString ?? "" )
    }

    var image: URL? {
        PokemonImageURLGenerator.generatePosterURL(for: id)
    }

    var name: String {
        pokemonData.name.capitalized
    }

    // MARK: - Private Properties
    private let pokemonData: NamedURLResource

    // MARK: - Initialization
    init(_ pokemonData: NamedURLResource) {
        self.pokemonData = pokemonData
    }
}

extension PokemonModel: Hashable { }

extension PokemonModel: Equatable {

    static func == (lhs: PokemonModel, rhs: PokemonModel) -> Bool {
        lhs.id == rhs.id && lhs.name == rhs.name && lhs.image == rhs.image
    }
}
