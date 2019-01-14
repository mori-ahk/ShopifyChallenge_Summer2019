//
//  ViewController.swift
//  ShopifyChallenge_Summer2019
//
//  Created by Morteza Ahmadi on 2019-01-12.
//  Copyright © 2019 Morteza Ahmadi. All rights reserved.
//

import UIKit

class CustomCollectionTableViewController: UITableViewController {
    
    var dataSource = CustomCollection() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var productIDs : [Int]? = []
    var products : Products? = nil
    let customCollectionCellIdentifier = "customCollectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: customCollectionCellIdentifier)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Collections"
        NetworkServices.sharedInstance().requestData(for: APIRouter.CustomCollection) { (data: CustomCollection?) -> Void in
            guard let data = data else { return }
            self.dataSource = data
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.customCollection.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customCollectionCellIdentifier, for: indexPath)
        let dataForEachCell = dataSource.customCollection[indexPath.row]
        cell.textLabel?.text = dataForEachCell.title.components(separatedBy: " ")[0]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCollectionID = dataSource.customCollection[indexPath.row].id
        let selectedCollection = dataSource.customCollection[indexPath.row]
        request(collect: selectedCollectionID, completionHandler: {
            guard let productIDs = self.productIDs else { return }
            self.fetchProducts(with: productIDs, completionHandler: {
                guard let products = self.products else { return }
                self.navigateToCollectionDetailTableView(with: products, for: selectedCollection)
            })
        })
    }
    
    private func request(collect withID: Int, completionHandler: @escaping () -> Void) {
        NetworkServices.sharedInstance().requestData(for: APIRouter.Collection(with: withID)) { (data: Collect?) in
            guard let data = data else { return }
            guard let productIDs = data.productIDs else { return }
            self.productIDs = productIDs
            completionHandler()
        }
    }
    
    private func fetchProducts(with productIDs: [Int], completionHandler: @escaping () -> Void) {
        NetworkServices.sharedInstance().requestData(for: APIRouter.Products(with: productIDs)) { (data: Products?) in
            guard let data = data else { return }
            self.products = data
            completionHandler()
        }
    }
    
    private func navigateToCollectionDetailTableView(with: Products, for selectedCollection: CustomCollection.ShopifyCollection) {
        let detailViewController = CollectionDetailTableViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
        detailViewController.navigationItem.title = selectedCollection.title.components(separatedBy: " ")[0]
        detailViewController.selectedCollection = selectedCollection
        detailViewController.dataSource = self.products
    }
}
