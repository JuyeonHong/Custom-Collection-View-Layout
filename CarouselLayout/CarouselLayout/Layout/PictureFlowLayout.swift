//
//  PictureFlowLayout.swift
//  CarouselLayout
//
//  Created by hongjuyeon_dev on 2019/12/04.
//  Copyright © 2019 hongjuyeon_dev. All rights reserved.
//

import UIKit

class PictureFlowLayout: UICollectionViewFlowLayout {
    
    let standardItemAlpha: CGFloat = 0.5
    let standardItemScale: CGFloat = 0.5
    
    private var attributeCache: [UICollectionViewLayoutAttributes] = []
    
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let inset = collectionView.contentInset
        return collectionView.bounds.width - (inset.left + inset.right)
    }
    
    private var contentHeight: CGFloat = 0
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        super.prepare()
        guard attributeCache.isEmpty, let collectionView = collectionView else { return }
        
        let xOffset: CGFloat = (collectionView.frame.width - 200) / 2
        var yOffset: CGFloat = 0.0
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let frame = CGRect(x: xOffset,
                               y: yOffset,
                               width: 200.0,
                               height: 300.0)
            let attributes = collectionView.layoutAttributesForItem(at: indexPath)
            attributes?.frame = frame
            attributeCache.append(attributes ?? UICollectionViewLayoutAttributes())
            contentHeight = max(contentHeight, frame.maxY)
            yOffset += itemSize.height
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        for attributes in attributeCache {
            if attributes.frame.intersects(rect) {
                changeLayoutAttributes(attributes)
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    //    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    //        return attributeCache[indexPath.item]
    //    }
    
    //    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    //        let attributes = super.layoutAttributesForElements(in: rect)
    //        var attributesCopy = [UICollectionViewLayoutAttributes]()
    //
    //        for itemAttributes in attributes! {
    //            let itemAttributesCopy = itemAttributes.copy() as! UICollectionViewLayoutAttributes
    //            changeLayoutAttributes(itemAttributesCopy)
    //            attributesCopy.append(itemAttributesCopy)
    //        }
    //
    //        return attributesCopy
    //    }
    
    // collectionView 스크롤하면 layout 업데이트하라는 뜻
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    func changeLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) {
        let collectionCenter = collectionView!.frame.size.height/2
        let offset = collectionView!.contentOffset.y
        let normalizedCenter = attributes.center.y - offset
        
        let maxDistance = self.itemSize.height + self.minimumLineSpacing
        let distance = min(abs(collectionCenter - normalizedCenter), maxDistance)
        
        let ratio = (maxDistance - distance) / maxDistance
        let alpha = ratio * (1 - self.standardItemAlpha) + self.standardItemAlpha
        let scale = ratio * (1 - self.standardItemScale) + self.standardItemScale
        
        attributes.alpha = alpha
        attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
    }
}
