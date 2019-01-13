//
//  Product.swift
//  ShopifyChallenge_Summer2019
//
//  Created by Morteza Ahmadi on 2019-01-12.
//  Copyright © 2019 Morteza Ahmadi. All rights reserved.
//

import Foundation

struct Product: Codable {
    
    let id: Int
    let title: String
    let bodyHtml: String
    let inventoryQuantity: Int
    let collectionTitle: String
    
}
