//
//  NetworkClientProtocol.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Foundation
import Combine

typealias BaseAPIProtocol = NetworkClientProtocol & DebuggerProtocol
typealias AnyPublisherResult<M> = AnyPublisher<M, APIError>

protocol NetworkClientProtocol: AnyObject {
    var session: URLSession { get }

    @available(iOS 13.0, *)
    @discardableResult

    func perform<M: Decodable, T>(with request: RequestBuilder,
                                  decoder: JSONDecoder,
                                  scheduler: T,
                                  responseObject type: M.Type)
    -> AnyPublisher<M, APIError> where M: Decodable, T: Scheduler
}

protocol DebuggerProtocol {
    var debugger: BaseAPIDebuger { get }
}
