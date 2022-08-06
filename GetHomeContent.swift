//
//  GetHomeContent.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import Foundation

struct HomeScreenImageFetch: HTTPRequest {
    struct Payload: Encodable {

    }
    struct Response: Codable {
        let carousel: [Carousel]
    }
    init(payload: Payload?) {
        httpBody = payload
    }
    let path = "/bff/home-content"
    let method = HTTPMethod.GET
    let httpHeaders = [
        "content-type" : "application/json",
    ]

    var queryItems: [URLQueryItem] = []
    var httpBody: Payload?
}
