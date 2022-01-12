//
//  CardSecondaryLabel.swift
//  
//
//  Created by Corey Beebe on 1/9/22.
//

import UIKit



class CardSecondaryLabel: UILabel {
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private let secondaryText: String?
    
    
    init(text: String?) {
        secondaryText = text
        super.init(frame: .zero)
        setup()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func setup() {
        
        text = secondaryText
        font = MrEavesFont.regular.font(size: 22)
        textColor = .print
        numberOfLines = 0
    }
}

