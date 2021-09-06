//
//  NewYorkFont.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//


import UIKit


/// The NewYork font enumerated with the resource returned in the `font` function. Any application intending to make use of this resource must call `registerFonts()` in the `AppDelegate` at `didFinishLaunchingWithOptions`.
public enum NewYorkFont: String, CaseIterable {


    case heavy = "Heavy"
    

    public func font(size: CGFloat) -> UIFont {
        UIFont(name: prefix + rawValue, size: size)!
    }
    
    private var prefix: String { "NewYorkMedium-" }
    public var name: String { prefix + rawValue }
}
