//
//  FullscreenCollectionView.swift
//  
//
//  Created by Corey Beebe on 9/10/21.
//

import UIKit


class FullscreenCollectionView: UICollectionView {
    
    
    init(view: UIView, cellViews: [UIView]) {
        //  Feed the bounds of the view directly into the collection view at init
        super.init(frame: view.bounds, collectionViewLayout: FullscreenCollectionLayout(view: view))
        translatesAutoresizingMaskIntoConstraints = false
        decelerationRate = UIScrollView.DecelerationRate.fast
//        isScrollEnabled = false
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
