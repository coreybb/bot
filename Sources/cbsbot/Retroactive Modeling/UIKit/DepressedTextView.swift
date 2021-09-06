//
//  DepressedTextView.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import UIKit


public class DepressedTextView: UITextView {

    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private lazy var innerShadow: CALayer = {
        let innerShadow: CALayer = CALayer()
        layer.addSublayer(innerShadow)
        return innerShadow
    }()

    private let radius: CGFloat
    private let color: UIColor
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public init(cornerRadius: CGFloat = 0, backgroundColor: UIColor = .cardWhite) {
        radius = cornerRadius
        color = backgroundColor
        super.init(frame: .zero, textContainer: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        setup()
    }

    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func setup() {
        
        translatesAutoresizingMaskIntoConstraints = false
        textContainerInset = UIEdgeInsets(top: 24, left: 18, bottom: 24, right: 18)
        innerShadow.frame = bounds

        let path: UIBezierPath = UIBezierPath(roundedRect: innerShadow.bounds.insetBy(dx: -1, dy: -1), cornerRadius: radius)
        let cutout: UIBezierPath = UIBezierPath(roundedRect: innerShadow.bounds, cornerRadius: radius).reversing()

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
        layer.backgroundColor = color.cgColor
    }
}

