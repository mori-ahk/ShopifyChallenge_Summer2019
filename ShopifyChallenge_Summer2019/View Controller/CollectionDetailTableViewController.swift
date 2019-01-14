//
//  CollectionDetailViewController.swift
//  ShopifyChallenge_Summer2019
//
//  Created by Morteza Ahmadi on 2019-01-13.
//  Copyright © 2019 Morteza Ahmadi. All rights reserved.
//

import UIKit

class CollectionDetailTableViewController: UITableViewController {
    
    var dataSource : Products? = nil
    var selectedCollection : CustomCollection.ShopifyCollection? = nil
    let selectedCollectionDetailCellIdentifier = "selectedCollectionDetailCell"
    let productDetailCellIdentifier = "productDetailCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(ProductDetailTableViewCell.self, forCellReuseIdentifier: productDetailCellIdentifier)
        self.tableView.register(CollectionDetailTableViewCell.self, forCellReuseIdentifier: selectedCollectionDetailCellIdentifier)
        self.view.backgroundColor = .white
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let products = dataSource?.products else { return 0 }
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let selectedCollection = selectedCollection else { return UITableViewCell()}
            let cell = tableView.dequeueReusableCell(withIdentifier: selectedCollectionDetailCellIdentifier, for: indexPath) as! CollectionDetailTableViewCell
            cell.configureCell(of: selectedCollection)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: productDetailCellIdentifier, for: indexPath) as! ProductDetailTableViewCell
            guard let products = dataSource?.products else { return UITableViewCell() }
            let product = products[indexPath.row]
            cell.configureCell(of: product)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 130 : 80
    }
    
    
    
}
