//
//  SquircleView.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


open class SquircleView: UIView {

    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private let cornerRadius: CGFloat
    private lazy var maskLayer: CAShapeLayer = {
        layer.mask = $0
        return $0
    }(CAShapeLayer())
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public init(cornerRadius: CGFloat = 15) {
        self.cornerRadius = cornerRadius
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    public override var bounds: CGRect {
        set { setBounds(with: newValue) }
        get { return super.bounds }
    }
    
    
    
    //-----------------------
    //  MARK: - Private API
    //-----------------------
    private func setBounds(with newValue: CGRect) {

        super.bounds = newValue
        maskLayer.frame = newValue
        let newPath: CGPath = UIBezierPath(roundedRect: newValue, cornerRadius: cornerRadius).cgPath
        let key: String = "bounds.size"
        
        guard let animation: CABasicAnimation = layer.animation(forKey: key)?.copy() as? CABasicAnimation else {
            maskLayer.path = newPath
            maskLayer.masksToBounds = false
            return
        }
        
        let path: String = "path"
        animation.keyPath = path
        animation.fromValue = maskLayer.path
        animation.toValue = newPath
        maskLayer.path = newPath
        maskLayer.add(animation, forKey: path)
    }
}
