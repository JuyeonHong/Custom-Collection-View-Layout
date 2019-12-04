//
//  Picture.swift
//  CarouselLayout
//
//  Created by hongjuyeon_dev on 2019/12/04.
//  Copyright © 2019 hongjuyeon_dev. All rights reserved.
//

import UIKit

class Picture {
    let image: String
    let date: String
    let description: String
    
    init(image: String, date: String, description: String) {
        self.image = image
        self.date = date
        self.description = description
    }
    
    convenience init(dictionary: NSDictionary) {
        let image = dictionary["Image"] as? String
        let date = dictionary["Date"] as? String
        let description = dictionary["Description"] as? String
        
        self.init(image: image!, date: date!, description: description!)
    }
    
    class func loadPictures() -> [Picture] {
        var pictures = [Picture]()
        if let path = Bundle.main.path(forResource: "Pictures", ofType: "plist"), let picArray = NSArray(contentsOfFile: path) {
            for item in picArray {
                let picture = Picture(dictionary: item as? NSDictionary ?? [:])
                pictures.append(picture)
            }
        }
        return pictures
    }
}
