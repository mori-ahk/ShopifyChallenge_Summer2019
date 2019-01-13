//
//  Routs.swift
//  ShopifyChallenge_Summer2019
//
//  Created by Morteza Ahmadi on 2019-01-12.
//  Copyright © 2019 Morteza Ahmadi. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter : URLRequestConvertible {
    
    enum Contants {
        static let baseURL = "https://shopicruit.myshopify.com/admin/"
        static let accessToken = "c32313df0d0ef512ca64d5b336a0d7c6"
    }
    
    case CustomCollection
    case Collection(with: Int)
    case Products(with: [Int])
    
    var method : HTTPMethod {
        switch self {
        case .CustomCollection:
            return .get
        case .Collection:
            return .get
        case .Products:
            return .get
        }
    }
    
    var path : String {
        switch self {
        case .CustomCollection:
            return "custom_collections.json?page=1&access_token=\(Contants.accessToken)"
        case .Collection(let collectionID):
            return "collects.json?collection_id=\(collectionID))&page=1&access_token=\(Contants.accessToken)"
        case .Products(let productIDs):
                let fullProductIDForQuery = getProductionIDForQuery(from: productIDs)
            return "products.json?ids=\(fullProductIDForQuery)&page=1&access_token=\(Contants.accessToken)"
        }
    }
    
    private func getProductionIDForQuery(from productIDs: [Int]) -> String {
        var stringToReturn = ""
        for eachProductID in productIDs{
            if eachProductID == productIDs.last {
                stringToReturn.append(String(eachProductID))
            } else {
                stringToReturn.append(String(eachProductID) + ",")
            }
        }
        return stringToReturn
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Contants.baseURL.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.url = URL(string: request.url!.absoluteString.replacingOccurrences(of: "%3F", with: "?"))
        return request
    }
    
}
