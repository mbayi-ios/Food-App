//
//  HTTPClient.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import Foundation
import Combine

protocol NetworkClient {
    func perform<Request: HTTPRequest>(_ request: Request) -> AnyPublisher<Request.Response, Error>
}

class HTTPClient: NetworkClient {
    let tenantHeaderKey = "X-LBX-TENANT"

    enum HTTPClientError: Error {
        case unknown
        case error(statusCode: Int, data: Data)
    }

    init(environs: Environs, session: URLSession = URLSession(configuration: .default)) {
        self.session = session
        self.environs = environs
    }

    private let session: URLSession
    private let environs: Environs

    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    private lazy var encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()

    func perform<Request: HTTPRequest>(_ request: Request) -> AnyPublisher<Request.Response, Error> {
        var components = URLComponents()
        components.path = request.path

        if !request.queryItems.isEmpty {
            components.queryItems = request.queryItems
        }

        guard let url = components.url(relativeTo: environs.baseUrl) else {
            return Fail(error: HTTPClientError.unknown).eraseToAnyPublisher()
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue

        var headers = request.httpHeaders
        headers.updateValue(environs.tenant, forKey: tenantHeaderKey)
        urlRequest.allHTTPHeaderFields = headers

        if let httpBody = request.httpBody {
            do {
                urlRequest.httpBody = try encoder.encode(httpBody)
            } catch {
                return Fail(error: error).eraseToAnyPublisher()
            }
        }
        return perform(urlRequest)
            .decode(type: Request.Response.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    private func perform(_ request: URLRequest) -> AnyPublisher<Data, Error> {
        session.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw HTTPClientError.unknown
                }

                guard 200..<300 ~= httpResponse.statusCode else {
                    throw HTTPClientError.error(statusCode: httpResponse.statusCode, data: data)
                }
                return data
            }
            .eraseToAnyPublisher()
    }
}
