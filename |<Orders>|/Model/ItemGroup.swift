//
//  ItemGroup.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/12/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import Foundation

struct ItemGroup: Decodable {
    
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let productName: String
    let companyName: String
    let imageUrl: String
}
