//
//  CachableImage.swift
//  ShopifyChallenge_Summer2019
//
//  Created by Morteza Ahmadi on 2019-01-13.
//  Copyright © 2019 Morteza Ahmadi. All rights reserved.
//
import UIKit

class CachableImage : UIImageView {
    
    override func awakeFromNib() {
        self.backgroundColor = .clear
        self.clipsToBounds = true
        self.layer.masksToBounds = true
        self.contentMode = .scaleAspectFill
    }
    
    //Cache images in order to prevent excessive data usage.
    let imageCache = NSCache<AnyObject, AnyObject>()
    
    /**
     Download image and cache them in order to prevent excessive data usage.
     
     - Parameters:
     - withURLString: the image URL
     
     - Returns:
     */
    
    func loadImage(withURLString: String) {
        //we are reusing cells. Sometimes we need to reset cell components to show the right image.
        image = nil
        
        //Caching
        if let imageFromCache = imageCache.object(forKey: withURLString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        //Download the product image
        NetworkServices.sharedInstance().downloadProductImage(withURLString: withURLString) { (data) in
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data)
                self.imageCache.setObject(imageToCache!, forKey: withURLString as AnyObject)
                self.image = imageToCache
            }
        }
    }
}
