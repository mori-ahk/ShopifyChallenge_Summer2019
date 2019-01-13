//
//  ViewController.swift
//  ShopifyChallenge_Summer2019
//
//  Created by Morteza Ahmadi on 2019-01-12.
//  Copyright © 2019 Morteza Ahmadi. All rights reserved.
//

import UIKit

class CustomCollectionViewController: UIViewController {
    var dataSource = CustomCollection()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green.withAlphaComponent(0.7)
        
        NetworkServices.sharedInstance().requestData(for: APIRouter.CustomCollection) { (data: CustomCollection) -> Void in
            self.dataSource = data
        }
    }


}

