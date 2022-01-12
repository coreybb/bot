//
//  InterruptionController.swift
//  
//
//  Created by Corey Beebe on 1/9/22.
//

import UIKit


open class InterruptionController: UIViewController  {

    
    
    //---------------------------
    //  MARK: Private Properties
    //---------------------------
    private let interruption: Interruption
    private var feedbackNumber: Int?
    private var feedbackText: String?
    private lazy var interruptionView: InterruptionCardView = InterruptionCardView(interruption: interruption, delegate: self)

    

    //-------------
    //  MARK: Init
    //-------------
    public init(interruption: Interruption) {
        self.interruption = interruption
        super.init(nibName: nil, bundle: nil)
        setupUI()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func dismiss() {
        
        handleDismissAnimations {
           [unowned self] in
            
            self.dismiss(animated: false)
        }
    }
    
    
    private func handleDismissAnimations(_ complete: Closure?) {

        interruptionView.cardView.animateCardOffscreen()
        interruptionView.animateBlur(.invisible) { complete?() }
    }

      
    private func setupUI() {
        
        view.addSubview(interruptionView)
        interruptionView.fillSuperview()
    }
}




//-------------------------------------
//  MARK: - Interruption View Delegate
//-------------------------------------
extension InterruptionController: InterruptionViewDelegate {
    
    
    func shouldDismiss() {
        
        dismiss()
    }
}

