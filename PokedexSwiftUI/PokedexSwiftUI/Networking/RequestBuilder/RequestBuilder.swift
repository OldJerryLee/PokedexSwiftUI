//
//  RequestBuilder.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Foundation

protocol RequestBuilder: NetworkTarget {
    init(request: NetworkTarget)

    var pathAppendedURL: URL { get }
    
    func setQueryTo(urlRequest: inout URLRequest,
                    urlEncoding: URLEncoding,
                    queryParams: [String: String])
    func encodedBody(bodyEncoding: BodyEncoding, requestBody: [String: Any]) -> Data?
    func buildURLRequest() -> URLRequest
}
