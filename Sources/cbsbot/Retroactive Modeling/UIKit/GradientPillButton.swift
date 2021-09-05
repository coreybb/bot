//
//  GradientPillButton.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


public class GradientPillButton: UIButton {
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        let leftColor = #colorLiteral(red: 0.9874046445, green: 0.1490907967, blue: 0.4583566785, alpha: 1)
        let rightColor = #colorLiteral(red: 0.9902660251, green: 0.4092545509, blue: 0.3132936656, alpha: 1)
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
