//
//  PictureCell.swift
//  3by3FlowLayout
//
//  Created by hongjuyeon_dev on 2019/12/03.
//  Copyright © 2019 hongjuyeon_dev. All rights reserved.
//

import UIKit

class PictureCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var pictureData: Picture? {
        didSet {
            if let data = pictureData {
                dateLabel.text = data.date
                imageView.image = UIImage(named: data.image)
            }
        }
    }
}
