//
//  MrEavesFont.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


enum MrEavesFont: String, CaseIterable {

    case thin = "Thin"
    case thinItalic = "ThinItalic"
    case light = "Light"
    case lightItalic = "LightItalic"
    case book = "Book"
    case bookItalic = "BookItalic"
    case regular = "Reg"
    case regularItalic = "RegItalic"
    case bold = "Bold"
    case boldItalic = "BoldItalic"
    case heavy = "Heavy"
    case heavyItalic = "HeavyItalic"
    case ultra = "Ultra"
    case ultraItalic = "UltraItalic"
    
    private var prefix: String { "MrEavesXLModOT-" } 
    

    func font(size: CGFloat) -> UIFont {
        UIFont(name: prefix + rawValue, size: size)!
    }
    
    var name: String { prefix + rawValue }
}
