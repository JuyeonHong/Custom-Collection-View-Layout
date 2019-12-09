//
//  Picture.swift
//  PinterestLayout
//
//  Created by hongjuyeon_dev on 2019/12/09.
//  Copyright © 2019 hongjuyeon_dev. All rights reserved.
//

import UIKit

struct Picture {
    let date: String
    let description: String
    let image: UIImage
    
    init(date: String, description: String, image: UIImage) {
        self.date = date
        self.description = description
        self.image = image
    }
    
    init?(dictionary: NSDictionary) {
        guard
            let date = dictionary["Date"] as? String,
            let photo = dictionary["Image"] as? String,
            let description = dictionary["Description"] as? String,
            let image = UIImage(named: photo)
        else { return nil }
        
        self.init(date: date, description: description, image: image)
    }
    
    static func loadPictures() -> [Picture] {
        var pictures: [Picture] = []
        guard
            let path = Bundle.main.path(forResource: "Pictures", ofType: "plist"),
            let picArray = NSArray(contentsOfFile: path)
        else {
            return pictures
        }
        for item in picArray {
            if let picture = Picture(dictionary: item as? NSDictionary ?? [:]) {
                pictures.append(picture)
            }
        }
        return pictures
    }
}
