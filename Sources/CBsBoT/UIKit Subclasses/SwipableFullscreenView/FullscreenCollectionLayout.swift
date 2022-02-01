//
//  FullscreenCollectionLayout.swift
//
//
//  Created by Corey Beebe on 9/10/21.
//

import UIKit


class FullscreenCollectionLayout: CenteredCollectionViewFlowLayout {
    
    init(view: UIView) {
        super.init()
        
        scrollDirection = .horizontal
        minimumInteritemSpacing = 5

        let topPadding: CGFloat = 0
        sectionInset = UIEdgeInsets(top: topPadding, left: 0, bottom: 0, right: 0)
        let size: CGSize = CGSize(width: view.frame.width, height: view.frame.height)
        itemSize = size
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
