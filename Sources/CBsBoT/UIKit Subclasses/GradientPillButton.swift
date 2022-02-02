//
//  GradientPillButton.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


/// Pass in a `GradientPair` with `color1` and `color2` representing the desired gradient shading from left to right, respectively.
open class GradientPillButton: CustomButton {
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private let gradientPair: GradientPair
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public init(gradientPair: GradientPair = GradientPair(color1: #colorLiteral(red: 0.9874046445, green: 0.1490907967, blue: 0.4583566785, alpha: 1), color2: #colorLiteral(red: 0.9902660251, green: 0.4092545509, blue: 0.3132936656, alpha: 1))) {
        self.gradientPair = gradientPair
        super.init(frame: .zero)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //--------------------------------------
    //  MARK: - Public Superclass Overrides
    //--------------------------------------
    public override func draw(_ rect: CGRect) {
        super.draw(rect)

        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        let leftColor = gradientPair.color1
        let rightColor = gradientPair.color2
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        setTitleColor(.white, for: .normal)
        
        //  This allows us to pick at which "level" we're showing sublayers!
        layer.insertSublayer(gradientLayer, at: 0)
        layer.cornerRadius = rect.height / 2
        clipsToBounds = true
        gradientLayer.frame = rect
    }
}
