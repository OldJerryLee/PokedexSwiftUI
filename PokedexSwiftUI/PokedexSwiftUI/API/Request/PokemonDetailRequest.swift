//
//  PokemonDetailRequest.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Foundation

struct PokemonDetailRequest: NetworkTarget {
    let id: Int

    var baseURL: BaseURLType {
        .baseApi
    }

    var version: VersionType {
        .v2
    }

    var path: String? {
        "/pokemon/\(id)"
    }

    var methodType: HTTPMethod {
        .get
    }

    var queryParams: [String : String]?
    
    var queryParamsEncoding: URLEncoding? {
        .default
    }
}
