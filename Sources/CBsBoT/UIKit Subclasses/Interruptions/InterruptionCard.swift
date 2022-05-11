//
//  InterruptionCard.swift
//  
//
//  Created by Corey Beebe on 1/9/22.
//

import UIKit


protocol InterruptionCardDelegate: AnyObject {
    
    func superviewShouldDismiss()
}



class InterruptionCard: SquircleView {
    
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private var isFirstLoad: Bool = true
    private weak var delegate: InterruptionCardDelegate?
    
    private lazy var dismissButton: UIButton = {
    
        let button: UIButton = UIButton(type: .system)
        let icon: UIImage = UIImage(named: "x")!
        button.setImage(icon, for: .normal)
        button.addTarget(self, action: #selector(handleDismissButtonTapped), for: .touchUpInside)
        button.tintColor = .darkGray
        return button
    }()
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    init(delegate: InterruptionCardDelegate) {
        self.delegate = delegate
        super.init(cornerRadius: 24)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    override func layoutSubviews() {
        super.layoutSubviews()

        setup()
    }
    
    
    
    //---------------------
    //  MARK: - Public API
    //---------------------
    func animateCardOffscreen(_ complete: Closure? = nil) {
        
        let offScreen: CGFloat = 1024
        let offscreenTransform: CGAffineTransform = transform.translatedBy(x: 0, y: offScreen)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            [unowned self] in
            self.transform = offscreenTransform
            self.endEditing(true)
            complete?()
        })
    }
    

    
    //----------------------
    //  MARK: - Private API
    //----------------------
    @objc private func handleDismissButtonTapped() {
        
        animateCardOffscreen {
            [unowned self] in
            self.delegate?.superviewShouldDismiss()
        }
    }
    
    
    private func setup() {
        
        guard isFirstLoad else { return }
        isFirstLoad.toggle()
        
        setupUI()
        addGesture()
        setupCardViewAnimation()
    }
    
    
    private func setupUI() {
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .cardWhite
        layoutDismissButton()
    }
    
    
    private func addGesture() {
        
        let panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
    }
    
    
    @objc private func handlePan(gesture: UIPanGestureRecognizer) {
        
        switch gesture.state {
        case .began: panBegan()
        case .changed: panChanged(gesture)
        case .ended: panEnded(gesture)
        default: ()
        }
    }
    
    
    private func panBegan() {
        
        subviews.forEach {
            $0.layer.removeAllAnimations()
        }
    }
    
    
    private func panChanged(_ gesture: UIPanGestureRecognizer) {
        
        let translation: CGPoint = gesture.translation(in: nil)
        transform = CGAffineTransform(translationX: 0, y: translation.y)
    }
    
    
    private func panEnded(_ gesture: UIPanGestureRecognizer) {

        let yDirection: CGFloat = gesture.translation(in: nil).y > 0 ? 1 : -1

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            [unowned self] in

            self.animateCard(in: yDirection, self.shouldDismiss(for: gesture))
        
        }) {  [unowned self] (_) in
             
            if shouldDismiss(for: gesture) {
                removeFromSuperview()
            }
        }
    }
    
    
    private func animateCard(in yDirection: CGFloat, _ shouldDismiss: Bool) {

        if !shouldDismiss {
            transform = .identity
            return
        }

        let offScreen: CGFloat = 1024 * yDirection

        UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 0.77,
                       initialSpringVelocity: 0.4, options: .curveEaseOut) {
            [unowned self] in
            
            transform = CGAffineTransform(translationX: 0, y: offScreen)
            
        } completion: { _ in
            self.delegate?.superviewShouldDismiss()
        }
    }

    
    private func shouldDismiss(for gesture: UIPanGestureRecognizer) -> Bool {
        
        let heightMultiple: CGFloat = 0.33
        let threshold: CGFloat = frame.height * heightMultiple
        let absY: CGFloat = abs(gesture.translation(in: nil).y)
        return absY > threshold
    }
    
    
    private func setupCardViewAnimation() {

        transform = CGAffineTransform(translationX: 0, y: 1024)
        UIView.animate(withDuration: 1.2, delay: 0, usingSpringWithDamping: 0.77,
                       initialSpringVelocity: 0.4, options: .curveEaseOut, animations: {
            [unowned self] in
            self.transform = .identity
        })
    }
    
    
    private func layoutDismissButton() {

        addSubview(dismissButton)
        dismissButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor,
                             padding: .init(top: 16, left: 0, bottom: 0, right: 16),
                             size: .init(width: 25, height: 25))
    }
}
