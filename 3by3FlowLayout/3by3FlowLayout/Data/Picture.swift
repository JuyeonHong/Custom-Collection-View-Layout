//
//  Picture.swift
//  3by3FlowLayout
//
//  Created by hongjuyeon_dev on 2019/12/03.
//  Copyright © 2019 hongjuyeon_dev. All rights reserved.
//

import UIKit

class Picture {
    let image: String
    let date: String
    
    init(image: String, date: String) {
        self.image = image
        self.date = date
    }
    
    convenience init(dictionary: NSDictionary) {
        let image = dictionary["Image"] as? String
        let date = dictionary["Date"] as? String
        
        self.init(image: image!, date: date!)
    }
    
    static func loadPictures() -> [Picture] {
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
