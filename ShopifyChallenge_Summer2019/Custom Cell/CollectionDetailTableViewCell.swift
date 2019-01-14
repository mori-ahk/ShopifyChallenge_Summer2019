//
//  CollectionDetailTableViewCell.swift
//  ShopifyChallenge_Summer2019
//
//  Created by Morteza Ahmadi on 2019-01-13.
//  Copyright © 2019 Morteza Ahmadi. All rights reserved.
//

import UIKit

class CollectionDetailTableViewCell: UITableViewCell {
    
    let collectionImage: CachableImage = {
        let image = CachableImage()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let aboutCollection: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        label.text = "About The Collection:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bodyHtml: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
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
        self.addSubview(aboutCollection)
        self.addSubview(collectionImage)
        self.addSubview(bodyHtml)
        self.addSubview(collectionTitle)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        NSLayoutConstraint.activate([
            collectionImage.widthAnchor.constraint(equalToConstant: 100),
            collectionImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            collectionImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            collectionImage.rightAnchor.constraint(equalTo: self.aboutCollection.leftAnchor, constant: -12),
            collectionImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            aboutCollection.topAnchor.constraint(equalTo: self.collectionImage.topAnchor),
            aboutCollection.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            aboutCollection.bottomAnchor.constraint(equalTo: self.collectionTitle.topAnchor, constant: -8),
            collectionTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            collectionTitle.bottomAnchor.constraint(equalTo: self.bodyHtml.topAnchor, constant: -8),
            collectionTitle.leadingAnchor.constraint(equalTo: self.aboutCollection.leadingAnchor),
            bodyHtml.leadingAnchor.constraint(equalTo: self.aboutCollection.leadingAnchor),
            bodyHtml.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            ])
    }
    
    func configureCell(of collection: CustomCollection.ShopifyCollection) {
        collectionImage.loadImage(withURLString: collection.imageObject.src)
        bodyHtml.text = "\(collection.bodyHtml)"
        collectionTitle.text = "\(collection.title)"
        
    }
    
}
