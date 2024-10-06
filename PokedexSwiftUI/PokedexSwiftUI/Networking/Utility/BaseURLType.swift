//
//  BaseURLType.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Foundation

enum BaseURLType {
    case baseApi

    var desc: URL? {
        switch self {
        case .baseApi:
            return URL(string: "https://pokeapi.co/api")
        }
    }
}
