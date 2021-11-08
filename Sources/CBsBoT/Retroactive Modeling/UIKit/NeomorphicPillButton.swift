//
//  NeomorphicPillButton.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import UIKit


public class NeomorphicPillButton: UIButton {
    
    
    //----------------------------
    //  MARK: - Public Properties
    //----------------------------
    var fontSize: CGFloat = 17
    var fontColor: UIColor = .darkGray
    
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private var didLayoutSubviews: Bool = false
    

    
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
    
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func setupLayer() {
        
        backgroundColor = .neomorphicWhite
        titleLabel?.font = MrEavesFont.heavy.font(size: fontSize)
        setTitleColor(fontColor, for: .normal)
        layer.cornerRadius = frame.height / 2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowOpacity = 0.07
        layer.shadowRadius = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.1
    }
    

    private func setupShadowLayer() {
        
        let shadowLayer: CALayer = CALayer()
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.backgroundColor = UIColor.neomorphicWhite.cgColor
        shadowLayer.shadowColor = UIColor.white.cgColor
        shadowLayer.shadowOffset = CGSize(width: -1, height: -1)
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowRadius = 2
        shadowLayer.frame = bounds
        
        layer.insertSublayer(shadowLayer, at: 0)
    }
}
