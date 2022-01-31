//
//  FullscreenCollectionView.swift
//  
//
//  Created by Corey Beebe on 9/10/21.
//

import UIKit


class FullscreenCollectionView: UICollectionView {
    
    
    init(view: UIView, cellViews: [UIView]) {
        super.init(frame: .zero, collectionViewLayout: FullscreenCollectionLayout(view: view))
        translatesAutoresizingMaskIntoConstraints = false
        decelerationRate = UIScrollView.DecelerationRate.fast
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
