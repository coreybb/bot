//
//  MrEavesFont.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit



/// The MrEaves font enumerated with the resource returned in the `font` function. Any application intending to make use of this resource must call `registerFonts()` in the `AppDelegate` at `didFinishLaunchingWithOptions`.
public enum MrEavesFont: String, CaseIterable {

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
    

    public func font(size: CGFloat) -> UIFont {
        UIFont(name: prefix + rawValue, size: size)!
    }
    
    public var name: String { prefix + rawValue }
}



public enum MrEavesFontWeight {
    
    case thin, light, book, regular, bold, heavy, ultra
}
