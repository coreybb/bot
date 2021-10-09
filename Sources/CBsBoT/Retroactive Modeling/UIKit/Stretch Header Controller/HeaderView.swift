//
//  HeaderView.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


internal class HeaderView: UICollectionReusableView {
    
    
    
    //----------------------------
    //  MARK: - Public Properties
    //----------------------------
    var childView: UIView?

    
    
    //---------------
    //  MARK: - Init
    //---------------
    internal override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .clear
        addSubview(childView!)
        childView?.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    open override func layoutSubviews() {
        super.layoutSubviews()


    }
}
