//
//  PostSignIn.swift
//  FoodApp
//
//  Created by Amby on 07/08/2022.
//

import Foundation

struct PostSignIn: HTTPRequest {
    struct Payload: Encodable {
        let email: String
        let password: String

    }

    struct Response: Decodable {
        let cusomerId: Int
        let authCookie: String
    }

    init(payload: Payload ) {
        httpBody = payload
    }

    let path = "/bff/customers/sign-in"
    let method = HTTPMethod.POST
    let httpHeaders = [
        "content-type":"application/json"
    ]

    var queryItems: [URLQueryItem] = []
    var httpBody: Payload?
}
