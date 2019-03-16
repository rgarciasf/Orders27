//
//  ItemMenu.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/15/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import Foundation


struct ItemMenu: Decodable {
    
    let menu: Menu
}

struct Menu: Decodable {
    let title: String
    let results: [MenuResult]
}

struct MenuResult: Decodable {
    let productName: String
    let id: String
    let imageUrl: String
}
