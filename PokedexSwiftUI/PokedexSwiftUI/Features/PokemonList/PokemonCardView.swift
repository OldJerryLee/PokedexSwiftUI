//
//  PokemonCardView.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import SwiftUI

struct PokemonCardView: View {
    var pokemon: PokemonModel
    
    var body: some View {
        VStack(alignment: .center) {
            if let image = pokemon.image {
                PokemonImageView(imageURL: image)
                    .frame(maxWidth: 150, maxHeight: 200)
            }
            Text(pokemon.name)
                .lineLimit(1)
                .font(.title2)
                .minimumScaleFactor(0.5)
                .foregroundStyle(Color.primary)
                .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: 300)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.teal.opacity(0.3))
        )
    }
}

#Preview {
    let pokemon = PokemonModel(NamedURLResource(name: "poke", url: PokemonImageURLGenerator.generatePosterURL(for: 13)))
    
    return PokemonCardView(pokemon: pokemon)
}
