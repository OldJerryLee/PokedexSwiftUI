//
//  NamedURLResource.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Foundation

struct NamedURLResource: Decodable, Hashable {
    let name: String
    let url: URL?
}
