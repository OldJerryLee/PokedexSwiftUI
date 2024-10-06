//
//  HTTPMethod.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

public enum HTTPMethod: Equatable {
    case get
    case post
    case put
    case delete

    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        }
    }
}
