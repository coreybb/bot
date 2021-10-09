//
//  StretchHeaderCollectionCell.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


internal class StretchHeaderCollectionCell: UICollectionViewCell {
    
    
    private var didLayoutSubviews = false
    
    
    //----------------------------
    //  MARK: - Public Properties
    //----------------------------
    public var childView: UIView! {
        didSet {
            if didLayoutSubviews { return }
            containerView.addSubview(childView)
            childView.fillSuperview()
            didLayoutSubviews = true
        }
    }
    
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private let containerView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    internal override func layoutSubviews() {
        super.layoutSubviews()
        
        if didLayoutSubviews { return }
        addSubview(containerView)
        containerView.fillSuperview()
        didLayoutSubviews = true
    }
}
