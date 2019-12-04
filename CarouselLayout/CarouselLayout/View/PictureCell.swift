//
//  PictureCell.swift
//  CarouselLayout
//
//  Created by hongjuyeon_dev on 2019/12/03.
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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 85 / 255.0, green: 85 / 255.0, blue: 85 / 255.0, alpha: 1.0).cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        dateLabel.text = ""
        descriptionLabel.text = ""
    }
}
