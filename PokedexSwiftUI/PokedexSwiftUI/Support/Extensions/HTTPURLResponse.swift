//
//  HTTPURLResponse.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Foundation

extension HTTPURLResponse {
    var isResponseOK: Bool {
        return (200..<299).contains(statusCode)
    }
}
