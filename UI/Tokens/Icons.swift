//
//  Icons.swift
//  FoodApp
//
//  Created by Amby on 05/08/2022.
//

import Foundation
import SwiftUI
struct Icons {
    let tabs = Tabs()

    struct Tabs {
        let account = Image("tab.account", bundle: .main).renderingMode(.template)
        let accountSelected = Image("tab.account.selected", bundle: .main).renderingMode(.template)
        let home = Image("tab.home", bundle: .main).renderingMode(.template)
        let homeSelected = Image("tab.home.selected", bundle: .main).renderingMode(.template)
        let order = Image("tab.order", bundle: .main).renderingMode(.template)
    }
}
