//
//  NetworkClientManager.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Foundation
import Combine

class NetworkClientManager<Target: RequestBuilder> {

    typealias AnyPublisherResult<M> = AnyPublisher<M, APIError>
    private let clientURLSession: NetworkClientProtocol

    public init(clientURLSession: NetworkClientProtocol = NetworkClient()) {
        self.clientURLSession = clientURLSession
    }

    func request<M, T>(request: Target,
                       scheduler: T,
                       responseObject type: M.Type) -> AnyPublisherResult<M> where M: Decodable, T: Scheduler {

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return clientURLSession.perform(with: request, decoder: decoder, scheduler: scheduler, responseObject: type)
    }
}
