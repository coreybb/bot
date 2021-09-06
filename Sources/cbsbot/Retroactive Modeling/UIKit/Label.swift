//
//  Label.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


public class Label: UILabel {
    
    
    public init(text: String = "", fontWeight: MrEavesFontWeight = .regular, fontSize: CGFloat,
         textColor: UIColor = .print, alpha: CGFloat = 1, textAlignment: NSTextAlignment = .left,
         numberOfLines: Int = 0) {
        
        super.init(frame: .zero)
        font = font(weight: fontWeight, size: fontSize)
        translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.alpha = alpha
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func font(weight: MrEavesFontWeight, size: CGFloat) -> UIFont {
        
        switch weight {
        case .thin: return MrEavesFont.thin.font(size: size)
        case .light: return MrEavesFont.light.font(size: size)
        case .book: return MrEavesFont.book.font(size: size)
        case .regular: return MrEavesFont.regular.font(size: size)
        case .bold: return MrEavesFont.bold.font(size: size)
        case .heavy: return MrEavesFont.heavy.font(size: size)
        case .ultra: return MrEavesFont.ultra.font(size: size)
        }
    }
}
