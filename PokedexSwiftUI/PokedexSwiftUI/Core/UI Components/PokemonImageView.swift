//
//  PokemonImageView.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import SwiftUI

struct PokemonImageView: View {
    let imageURL: URL

    var body: some View {
        ZStack {
            //TODO: Adicionar um background?
//            Image(.pokemonBg)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .opacity(0.3)
            ImageView(withURL: imageURL)
                .aspectRatio(contentMode: .fit)
        }
    }
}

#Preview {
    PokemonImageView(imageURL: PokemonImageURLGenerator.generatePosterURL(for: 5)!)
}
