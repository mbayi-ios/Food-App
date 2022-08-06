//
//  Environs.swift
//  FoodApp
//
//  Created by Amby on 06/08/2022.
//

import Foundation

struct Environs {
    let baseUrl: URL?
    let tenant: String

    static var development: Self {
        Environs(
           // baseUrl: URL(staticString: "https://lbapi.lunchbox.dev"),
            baseUrl: URL(staticString: "https://c34ace47-901b-40dd-b937-9c555ad881cd.mock.pstmn.io/"),
            tenant: "demo")
    }

    static var postman: Self {
        Environs (
            baseUrl: URL(staticString: "https://c34ace47-901b-40dd-b937-9c555ad881cd.mock.pstmn.io/"),
                  tenant: "demo")
    }
}
