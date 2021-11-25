//
//  NeomorphicView.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


/// A neomorphic view. Set `circular` to `true` at initialization if a perfectly circular view is required. If a `cornerRadius` is provided at initialization for a `circular` view, `cornerRadius` will be ignored. Any subviews provided at initialization will fill the superview with clipped bounds, with no additional configuration.
open class NeomorphicView: UIView {
    
    
    
    //----------------------------
    //  MARK: - Public Properties
    //----------------------------
    public lazy var contentView: UIView = {

        let view: UIView = UIView()
        view.backgroundColor = color
        view.layer.shadowRadius = layer.shadowRadius
        return view
    }()
    
    var subview: UIView?
    
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private var color: UIColor = .neomorphicWhite
    private var cornerRadius: CGFloat?
    private var circular: Bool = false
    private var hidesVerticalShadow: Bool = false

    
    
    //----------------
    //  MARK: - Init
    //----------------
    public init(color: UIColor? = nil, cornerRadius: CGFloat? = nil, circular: Bool = false, subview: UIView? = nil, hidesVerticalShadow: Bool = false) {
        super.init(frame: .zero)
        self.color = color ?? .neomorphicWhite
        self.cornerRadius = cornerRadius
        self.circular = circular
        self.subview = subview
        self.hidesVerticalShadow = hidesVerticalShadow
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    open override func layoutSubviews() {
        super.layoutSubviews()

        setup()
    }


    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func setup() {

        setupLayer()
        layoutForeground()
        layoutSubviewIfNeeded()
    }


    private func setupLayer() {
        
        let shadowYOffset = hidesVerticalShadow ? 0 : -3.88

        clipsToBounds = false
        backgroundColor = color
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .init(width: -3, height: shadowYOffset)
        
        if let cornerRadius = cornerRadius {
            layer.cornerRadius = cornerRadius
        }
        
        if circular  {
            layer.cornerRadius = frame.height / 2
        }
    }


    private func layoutForeground() {
        
        let shadowYOffset: CGFloat = {
            if hidesVerticalShadow { return 0 }
            return 3.3
        }()

        addSubview(contentView)
        contentView.fillSuperview()
        contentView.layer.cornerRadius = layer.cornerRadius
        contentView.layer.shadowColor =  UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.11
        contentView.layer.shadowOffset = CGSize(width: 3.3, height: shadowYOffset)
    }
    
    
    private func layoutSubviewIfNeeded() {

        guard let subview: UIView = subview else { return }
        contentView.addSubview(subview)
        subview.clipsToBounds = true
        subview.layer.cornerRadius = layer.cornerRadius
        subview.fillSuperview()
    }
}

