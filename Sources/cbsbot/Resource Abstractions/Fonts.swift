//
//  Fonts.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit

public let fontBundle = Bundle.module

public func registerFonts() {
    
    let mrEavesFontNames: [String] = MrEavesFont.allCases.map { $0.name }
    mrEavesFontNames.forEach {
        _ = UIFont.registerFont(bundle: .module, fontName: $0, fontExtension: "ttf")
    }
}

extension UIFont {
    
    static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) -> Bool {

        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
            fatalError("Couldn't find font \(fontName)")
        }

        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            fatalError("Couldn't load data from the font \(fontName)")
        }

        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }

        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterGraphicsFont(font, &error)
        guard success else {
            print("Error registering font: \(fontName). Maybe it was already registered.")
            return false
        }

        return true
    }
}

struct CustomFonts {
    var text = "Hello, World!"
}
