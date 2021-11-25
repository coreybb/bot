//
//  LeftAlignedCollectionView.swift
//  
//
//  Created by Corey Beebe on 10/17/21.
//

import UIKit


open class LeftAlignedCollectionView: UICollectionView {
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public init(cellSpacing: CGFloat = 5) {
        let layout: LeftAlignedCollectionLayout = LeftAlignedCollectionLayout(cellSpacing: cellSpacing)
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

