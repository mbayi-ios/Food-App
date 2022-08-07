//
//  PostSignUp.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import Foundation

struct PostSignUp: HTTPRequest {
    struct Payload: Encodable {
        let email: String
        let password: String
        let firstName: String
        let lastName: String
        let phone: Int
    }

    struct Response: Decodable {
        let email: String
        let password: String
    }

    init(payload: Payload) {
        httpBody = payload
    }

    let path = "/bff/customers/sign-up"
    let method = HTTPMethod.POST
    let httpHeaders = [
        "content-type" : "application/json",
    ]

    var queryItems: [URLQueryItem] = []
    var httpBody: Payload?
}
