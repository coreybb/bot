//
//  StretchHeaderCollectionCell.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


internal class StretchHeaderCollectionCell: UICollectionViewCell {
    
    
    //----------------------------
    //  MARK: - Public Properties
    //----------------------------
    public var childView: UIView! {
        didSet {
            if didLayoutChildView { return }
            containerView.addSubview(childView)
            childView.fillSuperview()
            didLayoutChildView = true
        }
    }
    
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private var didLayoutChildView = false
    private let containerView: View = View()
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(containerView)
        containerView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
