//
//  ViewController.swift
//  CarouselLayout
//
//  Created by hongjuyeon_dev on 2019/12/03.
//  Copyright © 2019 hongjuyeon_dev. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    let pictures = Picture.loadPictures()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView.collectionViewLayout as? PictureFlowLayout {
            layout.estimatedItemSize = CGSize(width: 200.0 * layout.standardItemScale,
                                              height: 300.0 * layout.standardItemScale)
            layout.minimumInteritemSpacing = 200.0
        }
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath) as! PictureCell
        cell.picture = pictures[indexPath.item]
        return cell
    }
}
