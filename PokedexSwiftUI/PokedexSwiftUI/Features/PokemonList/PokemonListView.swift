//
//  PokemonList.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import SwiftUI

struct PokemonListView: View {
    private let cancelable = Cancelable()
    private let columns = [
        GridItem(.adaptive(minimum: 100, maximum: 500)),
        GridItem(.adaptive(minimum: 100, maximum: 500))
    ]
    @State private var isLoading = true

    @StateObject var viewModel: PokemonListViewModel = .init()

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, content: {
                    ForEach(viewModel.pokemonList, id: \.self) { pokemon in
                        NavigationLink {
                            //PokemonDetailView(id: pokemon.id)
                            PokemonDetailView()
                        } label: {
                            PokemonCardView(pokemon: pokemon)
                                .onAppear() {
                                    if viewModel.shouldLoadNewPokemons(for: pokemon) {
                                        viewModel.getPokemonData()
                                    }
                                }
                        }
                    }

//                    else {
//                        Color.clear
//                            .onAppear {
//                                if !viewModel.pokemonList.isEmpty {
//                                    viewModel.getPokemonData()
//                                }
//                            }
//                    }
                })
                if isLoading {
                    ProgressView()
                }
            }
            .padding(.horizontal, 5)
            .navigationTitle("Pokemon")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                handleState()
                viewModel.getPokemonData()
            }
        }
    }
}

#Preview {
    PokemonListView()
}

extension PokemonListView {
    private func handleState() {
        viewModel.loadingState
            .receive(on: WorkScheduler.mainThread)
            .sink { state in
                switch state {
                case .loadStart:
                    isLoading = true

                case .dismissAlert:
                    isLoading = false

                case .emptyStateHandler:
                    isLoading = false
                }
            }
            .store(in: cancelable)
    }
}
