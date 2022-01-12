//
//  InterruptionView.swift
//  
//
//  Created by Corey Beebe on 1/9/22.
//

import UIKit


protocol InterruptionViewDelegate: AnyObject {
    
    func shouldDismiss()
}



class InterruptionView: UIView {
    
    
    
    //---------------------------
    //  MARK: Private Properties
    //---------------------------
    private weak var delegate: InterruptionViewDelegate?
    private let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    private var blurDidShow = false
    
    
    
    //-------------
    //  MARK: Init
    //-------------
    init(delegate: InterruptionViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !blurDidShow {
            animateBlur(.visible)
            blurDidShow.toggle()
        }
    }

    
    
    //---------------------
    //  MARK: - Public API
    //---------------------
    @objc func dismiss(_ complete: Closure? = nil) {
        
        animateBlur(.invisible) {
            [unowned self] in
            
            NotificationCenter.default.removeObserver(self)
            self.delegate?.shouldDismiss()
        }
    }
    
    
    func animateBlur(_ visibility: Visibility, _ complete: Closure? = nil) {
        
        guard visibility.rawValue != visualEffectView.alpha else {
            complete?(); return }
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            [unowned self] in

            self.visualEffectView.alpha = visibility.rawValue
        
        }) { (_) in
            
            complete?()
        }
    }
    
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func setupUI() {

        visualEffectView.alpha = 0
        addSubview(visualEffectView)
        visualEffectView.fillSuperview()
    }
}

