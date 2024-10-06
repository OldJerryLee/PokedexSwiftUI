//
//  PokemonImageURLGenerator.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Foundation

enum PokemonImageURLGenerator {

    static func generatePosterURL(for id: Int) -> URL? {
        let imageURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
        return URL(string: imageURL)
    }

    static func generateImageURL(for id: Int) -> URL? {
        let formatId = String(format: "%03d", id)
        let imageUrl = "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/\(formatId).png"
        return URL(string: imageUrl)
    }
}
