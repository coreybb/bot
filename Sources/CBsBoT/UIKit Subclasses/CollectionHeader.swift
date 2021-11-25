//
//  HeaderView.swift
//  
//
//  Created by Corey Beebe on 11/17/21.
//

import UIKit


///  A simple subclass of `UICollectionReusableView` that exposes a `childView` property and lays it out to fill the containing `HeaderView`.
open class CollectionHeader: UICollectionReusableView {
    
    
    //----------------------------
    //  MARK: - Public Properties
    //----------------------------
    public var childView: UIView?
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }

    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        backgroundColor = .clear
        addSubview(childView!)
        childView?.fillSuperview()
    }
}
