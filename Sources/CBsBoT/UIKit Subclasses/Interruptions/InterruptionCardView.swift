//
//  InterruptionCardView.swift
//  
//
//  Created by Corey Beebe on 1/9/22.
//

import UIKit

// TODO: Make extensible to reduce code duplication between the two CardViews?
class InterruptionCardView: InterruptionView {
    
    
    
    //----------------------------
    //  MARK: - Public Properties
    //----------------------------
    lazy var cardView: InterruptionCard = InterruptionCard(delegate: self)
    


    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private let interruption: Interruption
    private var isFirstLoad: Bool = true

    

    //---------------
    //  MARK: - Init
    //---------------
    init(interruption: Interruption, delegate: InterruptionViewDelegate) {
        self.interruption = interruption
        super.init(delegate: delegate)
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
    

    
    //-----------------------
    //  MARK: - Private API
    //-----------------------
    private func setup() {
 
        guard isFirstLoad else { return }
        isFirstLoad.toggle()
        layoutUI()
    }
    
    
    private func layoutUI() {
        
        layoutCardView()
        layoutCardContent()
    }

    
    private func layoutCardView()  {
        
        addSubview(cardView)
        cardView.widthAnchor.constraint(equalToConstant: cardWidth()).isActive = true
        cardView.heightAnchor.constraint(equalToConstant: cardHeight()).isActive = true
        cardView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    
    private func cardWidth() -> CGFloat {
        
        var multiplier: CGFloat {
            switch currentDevice {
            case .iPad10_5, .iPad7_9Or9_7: return 0.56
            case .iPad12_9: return 0.48
            default: return 0.8
            }
        }
        
        return frame.width * multiplier
    }
    
    
    private func cardHeight() -> CGFloat {
        
        var multiplier: CGFloat {
            switch currentDevice {
            case .iPhone4, .iPhone4_7, .iPhone5_5: return 0.63
            case .iPad10_5, .iPad7_9Or9_7: return 0.55
            case .iPad12_9: return 0.5
            default: return 0.55
            }
        }
        
        return frame.height * multiplier
    }
    
    
    private func layoutCardContent() {
        
        let contentView: CardContentView = CardContentView(interruption: interruption, delegate: self)
        cardView.addSubview(contentView)
        contentView.fillSuperview()
    }
}


//-------------------------------------
//  MARK: - Interruption Card Delegate
//-------------------------------------
extension InterruptionCardView: InterruptionCardDelegate {
    

    func superviewShouldDismiss() {
        
        cardView.animateCardOffscreen {
            [unowned self] in
            
            self.dismiss()
        }
    }
}

