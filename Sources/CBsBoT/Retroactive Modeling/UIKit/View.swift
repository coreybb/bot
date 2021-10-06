//
//  View.swift
//  
//
//  Created by Corey Beebe on 10/6/21.
//

import UIKit


/// A custom class intended to be used in lieu of `UIView` across projects relying exclusively on UIKit and Autolayout. Its only function is to universally set `translatesAutoresizingMaskIntoConstraints` to false.
class View: UIView  {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
