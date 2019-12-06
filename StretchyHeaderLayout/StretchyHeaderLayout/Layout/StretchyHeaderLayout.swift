//
//  StretchyHeaderLayout.swift
//  StretchyHeaderLayout
//
//  Created by hongjuyeon_dev on 2019/12/06.
//  Copyright © 2019 hongjuyeon_dev. All rights reserved.
//

import UIKit

class StretchyHeaderLayoutAttributes: UICollectionViewLayoutAttributes {
    var deltaY: CGFloat = 0
    
    // collectionview에서 copy되어서 오기 때문에 써줘야 함
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! StretchyHeaderLayoutAttributes
        copy.deltaY = deltaY
        return copy
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let attributes = object as? StretchyHeaderLayoutAttributes {
            if attributes.deltaY == deltaY {
                return super.isEqual(object)
            }
        }
        return false
    }
}


class StretchyHeaderLayout: UICollectionViewFlowLayout {
    
    var maximumStretchHeight: CGFloat = 0
    
    override class var layoutAttributesClass: AnyClass {
        return StretchyHeaderLayoutAttributes.self
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect) as! [StretchyHeaderLayoutAttributes]
        
        let offset = collectionView!.contentOffset
        // 아래로 당겼을 때
        if offset.y < 0 {
            let deltaY = abs(offset.y)
            for attributes in layoutAttributes {
                if let elementKind = attributes.representedElementKind, elementKind == UICollectionView.elementKindSectionHeader {
                    var frame = attributes.frame
                    frame.size.height = min(max(0, headerReferenceSize.height + deltaY), maximumStretchHeight)
                    frame.origin.y = frame.minY - deltaY
                    attributes.frame = frame
                    attributes.deltaY = deltaY
                }
            }
        }
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
