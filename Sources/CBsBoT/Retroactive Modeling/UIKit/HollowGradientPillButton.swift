//
//  HollowGradientPillButton.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


/// Pass in a `GradientPair` with `color1` and `color2` representing the desired gradient shading from left to right, respectively.
open class HollowGradientPillButton: CustomButton {
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private let gradientPair: GradientPair
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public init(gradientPair: GradientPair = GradientPair(color1: #colorLiteral(red: 0.9874046445, green: 0.1490907967, blue: 0.4583566785, alpha: 1), color2: #colorLiteral(red: 0.9902660251, green: 0.4092545509, blue: 0.3132936656, alpha: 1))) {
        self.gradientPair = gradientPair
        super.init()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        setTitleColor(.darkGray, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        let leftColor: UIColor = gradientPair.color1
        let rightColor: UIColor = gradientPair.color2
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [leftColor.cgColor, rightColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        
        //Apply a mask inside of the gradient
        let cornerRadius: CGFloat = rect.height / 2
        let maskLayer: CAShapeLayer = CAShapeLayer()
        let maskPath: CGMutablePath = CGMutablePath()
        let outerBezierPath: UIBezierPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        
        // "punch out the middle"
        let insetRect: CGRect = rect.insetBy(dx: 2, dy: 2)
        let innerBezierPath: UIBezierPath = UIBezierPath(roundedRect: insetRect, cornerRadius: cornerRadius)
        
        maskPath.addPath(innerBezierPath.cgPath)
        maskPath.addPath(outerBezierPath.cgPath)
        
        
        maskLayer.path = maskPath
        
        maskLayer.fillRule = .evenOdd
        //  DOCS: - .evenOdd winding rule:
        //  Specifies the even-odd winding rule. Count the total number of path crossings.
        //  If the number of crossings is even, the point is outside the path. If the number of
        //  crossings is odd, the point is inside the path.
        
        gradientLayer.mask = maskLayer
        
        //  This allows us to pick at which "level" we're showing sublayers!
        layer.insertSublayer(gradientLayer, at: 0)
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        gradientLayer.frame = rect
    }
}


