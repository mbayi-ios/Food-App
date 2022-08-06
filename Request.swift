//
//  Request.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

protocol HTTPRequest {
    associatedtype Payload: Encodable
    associatedtype Response: Decodable

    var method: HTTPMethod { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var httpHeaders: [String: String] { get }
    var httpBody: Payload? { get }
}

struct EmptyPayload: Encodable {}
