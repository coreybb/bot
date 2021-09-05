//
//  HeaderView.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


public class HeaderView: UICollectionReusableView {
    
    
    
    //----------------------------
    //  MARK: - Public Properties
    //----------------------------
    public var childView: UIView?

    
    
    //---------------
    //  MARK: - Init
    //---------------
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    public override func layoutSubviews() {
        super.layoutSubviews()

        addSubview(childView!)
        childView?.fillSuperview()
    }
}
