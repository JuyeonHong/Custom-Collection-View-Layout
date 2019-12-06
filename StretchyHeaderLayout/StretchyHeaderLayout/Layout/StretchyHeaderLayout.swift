//
//  StretchyHeaderLayout.swift
//  StretchyHeaderLayout
//
//  Created by hongjuyeon_dev on 2019/12/06.
//  Copyright © 2019 hongjuyeon_dev. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        let offset = collectionView!.contentOffset
        // 아래로 당겼을 때
        if offset.y < 0 {
            let deltaY = abs(offset.y)
            for attributes in layoutAttributes! {
                if let elementKind = attributes.representedElementKind, elementKind == UICollectionView.elementKindSectionHeader {
                    var frame = attributes.frame
                    frame.size.height = max(0, headerReferenceSize.height + deltaY)
                    frame.origin.y = frame.minY - deltaY
                    attributes.frame = frame
                }
            }
        }
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
