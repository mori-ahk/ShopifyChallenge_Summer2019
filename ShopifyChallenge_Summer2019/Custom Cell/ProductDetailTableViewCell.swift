//
//  ProductDetailTableViewCell.swift
//  ShopifyChallenge_Summer2019
//
//  Created by Morteza Ahmadi on 2019-01-13.
//  Copyright © 2019 Morteza Ahmadi. All rights reserved.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {
    
    let productImage: CachableImage = {
        let image = CachableImage()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let productName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalInventory: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(productImage)
        self.addSubview(productName)
        self.addSubview(totalInventory)
        self.addSubview(collectionTitle)
        self.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        NSLayoutConstraint.activate([
            productImage.widthAnchor.constraint(equalToConstant: 80),
            productImage.heightAnchor.constraint(equalToConstant: 64),
            productImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            productImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            productImage.rightAnchor.constraint(equalTo: self.productName.leftAnchor, constant: -8),
            productImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            productName.topAnchor.constraint(equalTo: self.productImage.topAnchor),
            productName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            productName.bottomAnchor.constraint(equalTo: self.totalInventory.topAnchor, constant: -4),
            totalInventory.leadingAnchor.constraint(equalTo: self.productName.leadingAnchor),
            totalInventory.bottomAnchor.constraint(equalTo: self.collectionTitle.topAnchor, constant: -4),
            totalInventory.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            collectionTitle.leadingAnchor.constraint(equalTo: self.productName.leadingAnchor),
            collectionTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            collectionTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            ])
    }
    
    func configureCell(of product: Product) {
        productImage.loadImage(withURLString: product.image.src)
        productName.text = "\(product.title)"
        totalInventory.text = "Inventory: \(product.totalInventoryQuantity)"
        collectionTitle.text = "Collection: \(product.title.components(separatedBy: " ")[0])"
    }
}
