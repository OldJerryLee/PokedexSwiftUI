//
//  VersionType.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Foundation

enum VersionType {
    case none
    case v2
    var desc: String {
        switch self {
        case .none:
            return ""
        case .v2:
            return "/v2"
        }
    }
}
