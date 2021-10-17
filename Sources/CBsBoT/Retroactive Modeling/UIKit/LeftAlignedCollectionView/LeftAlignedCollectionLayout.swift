//
//  LeftAlignedCollectionLayout.swift
//  
//
//  Created by Corey Beebe on 10/17/21.
//

import UIKit



class LeftAlignedCollectionLayout: UICollectionViewFlowLayout {
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private let cellSpacing: CGFloat
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    init(cellSpacing: CGFloat) {
        self.cellSpacing = cellSpacing
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributes = super.layoutAttributesForElements(in: rect)
        let cellSpacing: CGFloat = 5
        minimumInteritemSpacing = cellSpacing
        minimumLineSpacing = cellSpacing

        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }

            layoutAttribute.frame.origin.x = leftMargin

            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }

        return attributes
    }
}
