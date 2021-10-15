//
//  GradientView.swift
//  
//
//  Created by Corey Beebe on 10/8/21.
//


import UIKit


open class GradientView: View {
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private let colors: [CGColor]
    private let direction: GradientDirection
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public init(colors: [UIColor], direction: GradientDirection = .leftToRight) {
        self.colors = colors.map { $0.cgColor }
        self.direction = direction
        super.init(frame: .zero)
    }
    
    
    required public init?(coder: NSCoder) {
        fatalError()
    }
    
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        setupGradient()
    }
    
    
    
    //---------------------
    //  MARK: - Private API
    //----------------------
    private func setupGradient() {

        let gradientLayer: CAGradientLayer = CAGradientLayer()
        layer.addSublayer(gradientLayer)
        gradientLayer.colors = colors
        gradientLayer.frame = bounds
        gradientLayer.startPoint = direction.startPoint
        gradientLayer.endPoint = direction.endPoint
    }
}
