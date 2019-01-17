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
    
    //MARK: - Singleton Pattern
    private static var shared : NetworkServices = {
        let sharedInstance = NetworkServices.init()
        return sharedInstance
    }()
    
    class func sharedInstance() -> NetworkServices {
        return shared
    }
    
    private init() { }
    
    
    func requestData<T: Decodable>(for operation: APIRouter, completionHandler: @escaping (T?) -> Void) {
        Alamofire.request(operation).responseJSON (completionHandler: { (response) in
            switch response.result {
            case .success:
                let decoder = JSONDecoder()
                switch operation {
                case .CustomCollection:
                    let data = try? decoder.decode(CustomCollection.self, from: response.data!) as! T
                    completionHandler(data)
                case .Collection:
                    let data = try? decoder.decode(Collect.self, from: response.data!) as! T
                    completionHandler(data)
                case .Products:
                    let data = try? decoder.decode(Products.self, from: response.data!) as! T
                    completionHandler(data)
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
    /**
     Download product image.
     
     - Parameters:
     - withURLString: the image URL
     - completionHandler: A closure to pass the downloaded data once the download has finished
     
     - Returns:
     */
    
    func downloadProductImage(withURLString: String, completionHandler: @escaping (Data) -> Void) {
        let requestImageURL = URL(string: withURLString)
        Alamofire.request(requestImageURL!).responseData { (response) in
            switch response.result {
            case .success(let value):
                completionHandler(value)
            case .failure(let error):
                print("error \(error.localizedDescription)")
            }
        }
    }
    
}


