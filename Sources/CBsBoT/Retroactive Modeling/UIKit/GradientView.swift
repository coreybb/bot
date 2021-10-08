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
    private let direction: Direction
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public init(colors: [UIColor], direction: Direction = .horizontal) {
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
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        setupGradient()
    }
    
    
    
    //---------------------
    //  MARK: - Private API
    //----------------------
    private func setupGradient() {

        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        layer.addSublayer(gradientLayer)
        gradientLayer.frame = bounds
        
        let endPointX = (direction == .horizontal) ? frame.size.width : 0
        let endPointY = (direction == .horizontal) ? 0 : frame.size.height
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
    }
}
