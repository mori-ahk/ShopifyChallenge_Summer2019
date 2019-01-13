//
//  NetworkCalls.swift
//  ShopifyChallenge_Summer2019
//
//  Created by Morteza Ahmadi on 2019-01-12.
//  Copyright © 2019 Morteza Ahmadi. All rights reserved.
//

import Foundation
import Alamofire

class NetworkServices {
    
    typealias JSONObject = [String : AnyObject]
    //MARK: - Singleton Pattern
    private static var shared : NetworkServices = {
        let sharedInstance = NetworkServices.init()
        return sharedInstance
    }()
    
    class func sharedInstance() -> NetworkServices {
        return shared
    }
    
    private init() { }
    
    
    func requestData<T: Decodable>(for operation: APIRouter, completionHandler: @escaping (T) -> Void) {
        Alamofire.request(operation).responseJSON (completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                let decoder = JSONDecoder()
                switch operation {
                case .CustomCollection:
                    let data = try! decoder.decode(CustomCollection.self, from: response.data!) as! T
                    completionHandler(data)
                case .Products:
                    let data = try! decoder.decode(Product.self, from: response.data!) as! T
                    completionHandler(data)
                default:
                    break
                }
            case .failure(let error):
                print(error)
            }
        })
    }
}


