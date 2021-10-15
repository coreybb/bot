//
//  GradientTextView.swift
//  
//
//  Created by Corey Beebe on 10/15/21.
//

import UIKit


class GradientTextView: GradientView {
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private let text: String
    private let font: UIFont
    private let alignment: NSTextAlignment
    private var didLayoutSubviews: Bool = false
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    init(text: String, colors: [UIColor], font: UIFont, gradientDirection: GradientDirection = .leftToRight, textAlignment: NSTextAlignment = .center) {
        self.text = text
        self.font = font
        self.alignment = textAlignment
        super.init(colors: colors, direction: gradientDirection)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    override func layoutSubviews() {
        super.layoutSubviews()

        if didLayoutSubviews { return }
        setupLabel()
        didLayoutSubviews = true
    }
    
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func setupLabel() {
        
        let label = UILabel(frame: bounds)
        label.text = text
        label.font = font
        label.textAlignment = alignment
        addSubview(label)
        mask = label
    }
}
