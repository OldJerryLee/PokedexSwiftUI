//
//  PokemonListRequest.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Foundation

struct PokemonListRequest: NetworkTarget {
    let offset: Int
    let limit: Int

    var baseURL: BaseURLType {
        .baseApi
    }

    var version: VersionType {
        .v2
    }

    var path: String? {
        "/pokemon"
    }

    var methodType: HTTPMethod {
        .get
    }

    var queryParams: [String : String]? {
        [
            "limit": String(limit),
            "offset": String(offset)
        ]
    }

    var queryParamsEncoding: URLEncoding? {
        .percentEncoded
    }
}
