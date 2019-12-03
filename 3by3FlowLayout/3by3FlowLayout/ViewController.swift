//
//  ViewController.swift
//  3by3FlowLayout
//
//  Created by hongjuyeon_dev on 2019/12/03.
//  Copyright © 2019 hongjuyeon_dev. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    let picture: [Picture] = Picture.loadPictures()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picture.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath) as! PictureCell
        cell.pictureData = picture[indexPath.item]
        return cell
    }
}
