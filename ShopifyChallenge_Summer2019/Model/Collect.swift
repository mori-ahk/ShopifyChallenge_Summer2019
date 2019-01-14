//
//  Collect.swift
//  ShopifyChallenge_Summer2019
//
//  Created by Morteza Ahmadi on 2019-01-13.
//  Copyright © 2019 Morteza Ahmadi. All rights reserved.
//

import Foundation

struct Collect: Decodable {
    
    let collectObject : [Response]
    var productIDs : [Int]?
    
    enum CodingKey: String, Swift.CodingKey {
        case collects
    }
    
    init() {
        self.collectObject = []
        self.productIDs = []
    }
    
    private func getFullProductIDs(from json: [Response]) -> [Int] {
        var productIDs = [Int]()
        for eachObject in json {
            productIDs.append(eachObject.productID)
        }
        return productIDs
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        collectObject = try container.decode([Response].self, forKey: .collects)
        productIDs = getFullProductIDs(from: collectObject)
    }
    
}

extension Collect {
    
    struct Response: Decodable {
        let productID: Int
        let collectionID: Int
        
        enum CodingKey: String, Swift.CodingKey {
            case productID = "product_id"
            case collectionID = "collection_id"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKey.self)
            productID = try container.decode(Int.self, forKey: .productID)
            collectionID = try container.decode(Int.self, forKey: .collectionID)
        }
    }
    
}
