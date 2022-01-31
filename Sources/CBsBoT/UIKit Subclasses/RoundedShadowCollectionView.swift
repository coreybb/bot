//
//  RoundedShadowCollectionCell.swift
//  
//
//  Created by Corey Beebe on 1/31/22.
//

import UIKit


//  TODO: - Make extensible so that the developer can choose corner radius, shadow, etc.
//  TODO: - Implement as a Squircle by having the shadowed background view set to the bounds of the Squircle in the fore.
class RoundedShadowCollectionCell: UICollectionViewCell {
    
    

    //----------------------------
    //  MARK: - Public Properties
    //----------------------------
    lazy var mainBackgroundView: UIView = {
        
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = cornerRadius
        view.backgroundColor = .white

        return view
    }()
    
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private let cornerRadius: CGFloat = 10
    
    private lazy var shadowView: UIView =  {
        
        let view: UIView = UIView()
        view.clipsToBounds = false
        view.layer.cornerRadius = cornerRadius
        view.layer.drawsAsynchronously = true
        view.layer.shouldRasterize = true
        view.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        view.layer.rasterizationScale = UIScreen.main.scale
        view.layer.shadowOpacity = 0.2
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 3.0, height: 3)
        view.layer.shadowRadius = 9
        return view
    }()
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       super.touchesBegan(touches, with: event)
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.9, options: .curveEaseOut, animations: {
            [unowned self] in
           
            self.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
            self.setNeedsDisplay()
            
        }) { [unowned self] (_) in
            
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
                
                self.transform = .identity
                self.setNeedsDisplay()
            })
        }
    }
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func setupUI()  {
        
        layer.cornerRadius = cornerRadius
        layoutShadowView()
        layoutBackgroundView()
    }
    
    
    private func layoutShadowView()  {
        
        addSubview(shadowView)
        shadowView.fillSuperview()
    }
    
    
    private func layoutBackgroundView()  {
        
        shadowView.addSubview(mainBackgroundView)
        mainBackgroundView.fillSuperview()
    }
}
