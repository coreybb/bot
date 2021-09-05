//
//  MrEavesFont.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


enum MrEavesFont: String {

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
    

    func font(size: CGFloat) -> UIFont {
        UIFont(name: "MrEavesXLModOT-" + rawValue, size: size)!
    }
}
