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
            //  TODO: - Ensure this is called only once.
            containerView.addSubview(childView)
            childView.fillSuperview()
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
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(containerView)
        containerView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
