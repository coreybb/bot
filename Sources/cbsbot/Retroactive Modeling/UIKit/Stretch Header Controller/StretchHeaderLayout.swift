//
//  StretchHeaderLayout.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


internal class StretchHeaderLayout: UICollectionViewFlowLayout {
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    internal override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributes: [UICollectionViewLayoutAttributes]? = super.layoutAttributesForElements(in: rect)
        guard let header: UICollectionViewLayoutAttributes = (attributes?.first {
            $0.representedElementKind == UICollectionView.elementKindSectionHeader
            }) else { return attributes }

        guard let collectionView: UICollectionView = collectionView else { fatalError() }
        let contentOffsetY: CGFloat = collectionView.contentOffset.y
        
        if contentOffsetY > 0 {
            return attributes
        }
        
        let w: CGFloat = collectionView.frame.width
        let h: CGFloat = header.frame.height - contentOffsetY
        header.frame = CGRect(x: 0, y: 0, width: w, height: h)
        return attributes
    }
    
    
    internal override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        true
    }
}
