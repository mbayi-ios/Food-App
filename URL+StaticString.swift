//
//  URL+StaticString.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import Foundation

extension URL {
    public init(staticString value: StaticString) {
        guard let url = URL(string: "\(value)") else {
            preconditionFailure("Invalid URL string literal: \(value)")
        }
        self = url
    }
}
