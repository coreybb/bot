//
//  RoundedImageView.swift
//  
//
//  Created by Corey Beebe on 10/13/21.
//

import UIKit


open class RoundedImageView: View {
    
    
    //------------------------
    //  MARK: - Corner Radius
    //------------------------
    private let circular: Bool
    private let cornerRadius: CGFloat
    private let image: UIImage
    private let castsShadow: Bool
    private let borderColor: UIColor?
    private var didLayoutSubviews: Bool = false
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public init(image: UIImage, cornerRadius: CGFloat = 11, circular: Bool = false, castsShadow: Bool = true, borderColor: UIColor? = nil) {
        self.image = image
        self.circular = circular
        self.cornerRadius = cornerRadius
        self.castsShadow = castsShadow
        self.borderColor = borderColor
        super.init(frame: .zero)
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        if didLayoutSubviews { return }
        setupUI()
        didLayoutSubviews = true
    }
    
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func setupUI() {
        
        clipsToBounds = false
        
        if castsShadow {
            addShadow()
        }
        
        layoutImage()
    }
    
    
    private func addShadow() {
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10
        layer.drawsAsynchronously = true
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.shadowOffset = .init(width: 1, height: 2)
        
        let shadowCornerRadius = circular ? (frame.height / 2) : self.cornerRadius
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: shadowCornerRadius).cgPath
    }
    
    
    private func layoutImage() {
        
        let imageView: UIImageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = circular ? (frame.height / 2) : cornerRadius
        
        if let borderColor = borderColor {
            imageView.layer.borderColor = borderColor.cgColor
            imageView.layer.borderWidth = imageView.frame.width * 0.01
        }
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.fillSuperview()
    }
}
