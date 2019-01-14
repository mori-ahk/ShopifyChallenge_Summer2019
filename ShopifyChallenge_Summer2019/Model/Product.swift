//
//  Product.swift
//  ShopifyChallenge_Summer2019
//
//  Created by Morteza Ahmadi on 2019-01-12.
//  Copyright © 2019 Morteza Ahmadi. All rights reserved.
//

import Foundation

struct Products: Decodable {
    
    let products : [Product]
    
    enum CodingKey: String, Swift.CodingKey {
        case products
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        products = try container.decode([Product].self, forKey: .products)
    }
    
}
struct Product: Decodable {
    
    let id: Int
    let title: String
    let bodyHtml: String
    let variants: [Variant]
    let image: ProductImage
    var totalInventoryQuantity: Int = 0
    
    enum CodingKey: String, Swift.CodingKey {
        case id
        case title
        case bodyHtml = "body_html"
        case variants
        case image
    }
    private func getTotalInventory() -> Int {
        var totalInventoryQuantity = 0
        for eachVariant in variants {
            totalInventoryQuantity += eachVariant.inventoryQuantity
        }
        return totalInventoryQuantity
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        bodyHtml = try container.decode(String.self, forKey: .bodyHtml)
        variants = try container.decode([Variant].self, forKey: .variants)
        image = try container.decode(ProductImage.self, forKey: .image)
        totalInventoryQuantity = getTotalInventory()
    }
}

struct Variant: Decodable {
    
    let inventoryQuantity: Int
    
    enum CodingKey: String, Swift.CodingKey {
        case inventoryQuantity = "inventory_quantity"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        inventoryQuantity = try container.decode(Int.self, forKey: .inventoryQuantity)
    }
    
}

struct ProductImage: Decodable {
    let src: String
    
    enum CodingKey: String, Swift.CodingKey {
        case src
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        src = try container.decode(String.self, forKey: .src)
    }
}


