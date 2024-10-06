//
//  PokemonListRepository.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Combine
import Foundation

protocol PokedexListRepositoryProtocol {
    func fetch(offset: Int, resultLimit: Int) -> AnyPublisher<PokemonListResponse, APIError>
}

final class PokedexListRepository: NetworkClientManager<HttpRequest>, PokedexListRepositoryProtocol {
    
    func fetch(offset: Int, resultLimit: Int) -> AnyPublisher<PokemonListResponse, APIError> {
        let httpRequest = HttpRequest(request: PokemonListRequest(offset: offset, limit: resultLimit))

        return request(request:  httpRequest,
                       scheduler: RunLoop.main,
                       responseObject: PokemonListResponse.self)
    }
}
