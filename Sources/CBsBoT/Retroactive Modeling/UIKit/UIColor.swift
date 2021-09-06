//
//  UIColor.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit

public extension UIColor {
    
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255,
                  green: CGFloat(green) / 255,
                  blue: CGFloat(blue) / 255,
                  alpha: 1)
    }
    
    static var neomorphicWhite: UIColor { #colorLiteral(red: 0.937254902, green: 0.9333333333, blue: 0.9333333333, alpha: 1) }
    static var zircon: UIColor { #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9882352941, alpha: 1) }
    static var mayanBlue: UIColor { #colorLiteral(red: 0.3294117647, green: 0.7529411765, blue: 0.9960784314, alpha: 1) }
    static var cardWhite: UIColor { #colorLiteral(red: 0.937254902, green: 0.9333333333, blue: 0.9333333333, alpha: 1) }
    static var lifesaverGreen: UIColor { UIColor(red: 101/255, green: 221/255, blue: 189/255, alpha: 1.0) }
    static var vibrantGreen: UIColor { UIColor(red: 136/255, green: 231/255, blue: 178/255, alpha: 1.0) }
    static var celestialWhite: UIColor { UIColor(red: 248/255, green: 247/255, blue: 254/255, alpha: 1.0) }
    static var notQuiteWhite: UIColor { #colorLiteral(red: 0.9761044448, green: 0.9761790644, blue: 0.9778565951, alpha: 1) }
    static var buttonRed: UIColor { UIColor(red: 251/255, green: 123/255, blue: 135/255, alpha: 1.0) }
    static var punkRockRed: UIColor { UIColor(red: 255/255, green: 43/255, blue: 100/255, alpha: 1.0) }
    static var rajah: UIColor { #colorLiteral(red: 0.9915795922, green: 0.7910487652, blue: 0.4773200154, alpha: 1) }
    static var red: UIColor {UIColor(red: 255, green: 59, blue: 48)}
    static var orange: UIColor {UIColor(red: 255, green: 149, blue: 0) }
    static var yellow: UIColor {UIColor(red: 255, green: 204, blue: 0) }
    static var green: UIColor {UIColor(red: 76, green: 217, blue: 100) }
    static var tealBlue: UIColor { UIColor(red: 90, green: 200, blue: 250) }
    static var blue: UIColor { UIColor(red: 0, green: 122, blue: 255) }
    static var purple: UIColor { UIColor(red: 88, green: 86, blue: 214) }
    static var pink: UIColor { UIColor(red: 255, green: 45, blue: 85) }
    static var denimGray: UIColor { #colorLiteral(red: 0.2352941176, green: 0.2392156863, blue: 0.3333333333, alpha: 1) }
    static var silk: UIColor { #colorLiteral(red: 0.9252376681, green: 0.9188213646, blue: 0.9423148648, alpha: 1) }
    static var print: UIColor { #colorLiteral(red: 0.3137254902, green: 0.3137254902, blue: 0.3137254902, alpha: 1) }
    static var darkBackground: UIColor { #colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1) }
    static var darkBackgroundExtra: UIColor { #colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1) }
    static var graphGreen: UIColor { #colorLiteral(red: 0.5306149348, green: 0.9980708397, blue: 0.5905986388, alpha: 1) }
    static var accountantGreen: UIColor { #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1) }
}
