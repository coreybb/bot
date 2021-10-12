//
//  NeomorphicButton.swift
//  
//
//  Created by Corey Beebe on 10/11/21.
//

import UIKit



public class NeomorphicButton: UIButton {
    
    
    //----------------------------
    //  MARK: - Public Properties
    //----------------------------
    var color: UIColor = .cardWhite
    var fontSize: CGFloat = 13
    
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    var didLayoutSubviews: Bool = false

    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    public override func layoutSubviews() {
        super.layoutSubviews()
    
        if didLayoutSubviews { return }
        setupLayer()
        setupShadowLayer()
        didLayoutSubviews = true
    }
    
    
    private func setupLayer() {
        
        backgroundColor = color
        titleLabel?.font = MrEavesFont.book.font(size: fontSize)
        setTitleColor(.darkGray, for: .normal)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.066
        layer.shadowRadius = 1
        layer.cornerRadius = 8
    }
    

    //  TODO: - Abstract into CALayer class?
    private func setupShadowLayer() {
        
        let shadowLayer = CALayer()
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.backgroundColor = color.cgColor
        shadowLayer.shadowColor = UIColor.white.cgColor
        shadowLayer.shadowOffset = CGSize(width: -2, height: -1.66)
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowRadius = 2
        shadowLayer.frame = bounds
        
        layer.insertSublayer(shadowLayer, at: 0)
    }
}
