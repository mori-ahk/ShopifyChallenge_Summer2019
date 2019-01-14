//
//  CustomCollection.swift
//  ShopifyChallenge_Summer2019
//
//  Created by Morteza Ahmadi on 2019-01-12.
//  Copyright © 2019 Morteza Ahmadi. All rights reserved.
//

import Foundation

struct CustomCollection: Decodable {
    
    let customCollection : [ShopifyCollection]
    
    enum CodingKey: String, Swift.CodingKey {
        case customCollection = "custom_collections"
    }
    
    init() {
        self.customCollection = []
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKey.self)
        customCollection = try container.decode([ShopifyCollection].self, forKey: .customCollection)
    }
    
}

extension CustomCollection {
    
    struct ShopifyCollection : Decodable {
        
        let id : Int
        let title : String
        let bodyHtml : String
        let imageObject: ShopifyImageCollection
        
        enum CodingKey: String, Swift.CodingKey {
            case id
            case title
            case image
            case bodyHtml = "body_html"
        }
        
        init() {
            self.id = 0
            self.title = ""
            self.bodyHtml = ""
            self.imageObject = ShopifyImageCollection()
            
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKey.self)
            id = try container.decode(Int.self, forKey: .id)
            title = try container.decode(String.self, forKey: .title)
            bodyHtml = try container.decode(String.self, forKey: .bodyHtml)
            imageObject = try container.decode(ShopifyImageCollection.self, forKey: .image)
        }
    }
}

extension CustomCollection {
    
    struct ShopifyImageCollection: Decodable {
        
        let src : String
        
        enum CodingKey: String, Swift.CodingKey {
            case src
        }
        
        init() {
            self.src = ""
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKey.self)
            src = try container.decode(String.self, forKey: .src)
        }
    }
    
}
