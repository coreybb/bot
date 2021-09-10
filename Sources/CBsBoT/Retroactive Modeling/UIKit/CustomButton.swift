//
//  CustomButton.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import UIKit


/// A base class for creating custom `UIButton` subclasses that replicates the `isHighlighted` functionality of `ButtonType.system` when a custom initializer is required.
open class CustomButton: UIButton {

    
    public override var isHighlighted: Bool {
        
        get { return super.isHighlighted }
        
        set {
            guard newValue != isHighlighted else { return }

            if newValue == true {
                titleLabel?.alpha = 0.25
            } else {
                UIView.animate(withDuration: 0.25) {
                    self.titleLabel?.alpha = 1
                }
                super.isHighlighted = newValue
            }

            super.isHighlighted = newValue
        }
    }
}
