//
//  NewYorkFont.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


public enum NewYorkFont: String, CaseIterable {


    case heavy = "Heavy"
    

    public func font(size: CGFloat) -> UIFont {
        UIFont(name: prefix + rawValue, size: size)!
    }
    
    private var prefix: String { "NewYorkMedium-" }
    public var name: String { prefix + rawValue }
}
