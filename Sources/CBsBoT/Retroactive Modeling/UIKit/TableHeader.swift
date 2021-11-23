//
//  TableHeader.swift
//  
//
//  Created by Corey Beebe on 11/23/21.
//

import UIKit


///  A simple subclass of `UITableViewHeaderFooterView` that exposes a `childView` property and lays it out to fill the containing `TableHeader`.
open class TableHeader: UITableViewHeaderFooterView {
    
    
    //----------------------------
    //  MARK: - Public Properties
    //----------------------------
    public var childView: UIView?
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
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
