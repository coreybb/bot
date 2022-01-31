//
//  StretchHeaderCollectionView.swift
//  
//
//  Created by Corey Beebe on 10/12/21.
//

import UIKit


open class StretchHeaderCollectionView: UICollectionView {
    
    
    public init() {
        super.init(frame: .zero, collectionViewLayout: StretchHeaderLayout())
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
}
