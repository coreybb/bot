//
//  UINavigationController.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


public extension UINavigationController {
    

    func setTransparent() {
        
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }
}
