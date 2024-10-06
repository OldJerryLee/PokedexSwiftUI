//
//  PokemonListResponse.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Foundation

struct PokemonListResponse: Decodable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [NamedURLResource]
}
