//
//  PictureCell.swift
//  StretchyHeaderLayout
//
//  Created by hongjuyeon_dev on 2019/12/05.
//  Copyright © 2019 hongjuyeon_dev. All rights reserved.
//

import UIKit

class PictureCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var picture: Picture? {
        didSet {
            if let pic = picture {
                imageView.image = UIImage(named: pic.image)
                dateLabel.text = pic.date
                descriptionLabel.text = pic.description
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 0.6
        self.layer.borderColor = #colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        dateLabel.text = ""
        descriptionLabel.text = ""
    }
}
