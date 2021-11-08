//
//  RoundedButton.swift
//  
//
//  Created by Corey Beebe on 11/7/21.
//

import UIKit


open class RoundedButton: CustomButton {
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private var color: UIColor
    private var textColor: UIColor?
    private var text: String?
    private var font: UIFont?
    private var cornerRadius: CGFloat
    private var isCircular: Bool
    private var image: UIImage?
    private var didLayoutSubviews: Bool = false
    
    
    //----------------------
    //  MARK: - Public Init
    //----------------------
    public init(color: UIColor = .cardWhite, textColor: UIColor? = nil, text: String? = nil, font: UIFont? = nil, image: UIImage? = nil, cornerRadius: CGFloat = 15, isCircular: Bool = false) {
        
        self.color = color
        self.textColor = textColor
        self.text = text
        self.font = font
        self.cornerRadius = cornerRadius
        self.isCircular = isCircular
        self.image = image
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        if didLayoutSubviews { return }
        setup()
        didLayoutSubviews.toggle()
    }
    
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func setup() {
        
        setupLayer()
        backgroundColor = color
        titleLabel?.font = font
        setTitleColor(textColor, for: .normal)
        setImage(image, for: .normal)
    }
    
    
    private func setupLayer() {

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.066
        layer.shadowRadius = 1
        layer.cornerRadius = isCircular ? (frame.height / 2) : cornerRadius
    }
}
