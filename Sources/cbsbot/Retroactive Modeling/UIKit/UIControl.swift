//
//  UIControl.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


public extension UIControl {
    
    /// A simplified API for adding actions to UIControl objects like UIButton. Its default event is `.touchUpInside`.
    func addAction(for event: UIControl.Event = .touchUpInside, handler: @escaping UIActionHandler) {
        
        let action: UIAction = UIAction(handler: handler)
        addAction(action, for:event)
    }
}
