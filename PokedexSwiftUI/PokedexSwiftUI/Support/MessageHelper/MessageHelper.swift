//
//  MessageHelper.swift
//  PokedexSwiftUI
//
//  Created by Fabricio Pujol on 06/10/24.
//

import Foundation

struct MessageHelper {
    struct ServerError {
        static let general: String = "Bad Request"
        static let noInternet: String = "Check the Connection"
        static let timeOut: String = "Timeout"
        static let notFound: String = "No Result"
        static let serverError: String = "Internal Server Error"
        static let redirection: String = "Request doesn't seem to be proper."
        static let clientError: String = "Request doesn't seem to be proper."
        static let invalidResponse: String = "Invalid Server Response"
        static let unauthorizedClient: String = "Unauthorized Client"
    }
    struct DeviceStatus {
        static let unknownDeviceID: String = "Device ID Not Found"
    }
}
