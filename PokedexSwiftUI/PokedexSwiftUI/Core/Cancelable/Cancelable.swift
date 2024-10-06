//
//  Cancelable.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Combine

final class Cancelable {
    fileprivate(set) var subscriptions = Set<AnyCancellable>()

    func cancel() {
        subscriptions.removeAll()
    }
}

extension AnyCancellable {
    func store(in subscriber: Cancelable) {
        subscriber.subscriptions.insert(self)
    }
}
