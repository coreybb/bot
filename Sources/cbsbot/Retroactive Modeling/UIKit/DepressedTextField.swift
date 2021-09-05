//
//  DepressedTextField.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


public class DepressedTextField: UITextField {

    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private lazy var innerShadow: CALayer = {
        let innerShadow = CALayer()
        layer.addSublayer(innerShadow)
        return innerShadow
    }()

    private let radius: CGFloat
    private let leadingInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public init(cornerRadius: CGFloat = 0) {
        radius = cornerRadius
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: leadingInset)
    }

    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: leadingInset)
    }

    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: leadingInset)
    }
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        setup()
    }
    


    //----------------------
    //  MARK: - Private API
    //----------------------
    private func setup() {
        
        innerShadow.frame = bounds

        let path = UIBezierPath(roundedRect: innerShadow.bounds.insetBy(dx: -1, dy: -1), cornerRadius: radius)
        let cutout = UIBezierPath(roundedRect: innerShadow.bounds, cornerRadius: radius).reversing()

        path.append(cutout)
        innerShadow.shadowPath = path.cgPath
        innerShadow.masksToBounds = true
        innerShadow.shadowColor = UIColor.darkGray.cgColor
        innerShadow.shadowOffset = CGSize(width: 0, height: 2)
        innerShadow.shadowOpacity = 0.5
        innerShadow.shadowRadius = 2
        innerShadow.cornerRadius = radius
        
        
        clipsToBounds = false
        layer.cornerRadius = radius
        layer.drawsAsynchronously = true
        layer.shouldRasterize = true
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.rasterizationScale = UIScreen.main.scale
        layer.shadowOpacity = 0.5
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0.3)
        layer.shadowRadius = 6
        layer.backgroundColor = UIColor.cardWhite.cgColor
    }
}

