//
//  CircularButton.swift
//  Lifesaver
//
//  Created by Corey Beebe on 11/8/21.
//

import UIKit


class CircularButton: CustomButton {
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private var didLayoutSubviews: Bool = false
    private let color: UIColor?
    private let text: String?
    private let textColor: UIColor?
    private let font: UIFont?
    private let image: UIImage?
    private let cornerRadius: CGFloat
    private let isCircular: Bool
    private let castsShadow: Bool

    private lazy var shadowLayer: CALayer = {
       
        let layer: CALayer = CALayer()
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10
        layer.drawsAsynchronously = true
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.shadowOffset = .init(width: 1, height: 2)
        layer.masksToBounds = false
        return layer
    }()

    private lazy var imageLayer: CALayer? = {
        
        guard let image = image else { return nil }
        let layer: CALayer = CALayer()
        layer.frame = bounds
        layer.contents = image.cgImage
        layer.masksToBounds = true
        return layer
    }()
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public init(color: UIColor? = nil, text: String? = nil, textColor: UIColor? = nil, font: UIFont? = nil, image: UIImage? = nil, cornerRadius: CGFloat = 15, isCircular: Bool = false, castsShadow: Bool = false) {
        self.color = color
        self.text = text
        self.textColor = textColor
        self.font = font
        self.image = image
        self.cornerRadius = cornerRadius
        self.isCircular = isCircular
        self.castsShadow = castsShadow
        super.init(frame: .zero)
        performInitialSetup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError()
    }
    
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupLayers()
    }
    
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func performInitialSetup() {
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = color
        setTitle(text, for: .normal)
        setTitleColor(textColor, for: .normal)
        titleLabel?.font = font
    }
    
    
    private func setupLayers() {

        layer.cornerRadius = isCircular ? (frame.height / 2) : cornerRadius
        
        if let imageLayer = imageLayer {
            layer.insertSublayer(imageLayer, at: 0)
            imageLayer.cornerRadius = layer.cornerRadius
            imageLayer.frame = bounds
        }
        
        if castsShadow {
            layer.insertSublayer(shadowLayer, at: 0)
            shadowLayer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
            shadowLayer.cornerRadius = layer.cornerRadius
        }
    }
}

