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
    let image: String
    let description: String
    
    init(date: String, image: String, description: String) {
        self.date = date
        self.image = image
        self.description = description
    }
    
    init(dictionary: NSDictionary) {
        let date = dictionary["Date"] as? String
        let image = dictionary["Image"] as? String
        let description = dictionary["Description"] as? String
        
        self.init(date: date!, image: image!, description: description!)
    }
    
    static func loadPictures() -> [Picture] {
        var pictures: [Picture] = []
        if let path = Bundle.main.path(forResource: "Pictures", ofType: "plist"), let picArray = NSArray(contentsOfFile: path) {
            for item in picArray {
                let picture = Picture(dictionary: item as? NSDictionary ?? [:])
                pictures.append(picture)
            }
        }
        return pictures
    }
}
