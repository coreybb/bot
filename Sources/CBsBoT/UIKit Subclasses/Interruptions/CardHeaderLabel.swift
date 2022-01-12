//
//  CardHeaderLabel.swift
//  
//
//  Created by Corey Beebe on 1/9/22.
//

import UIKit


class CardHeaderLabel: UILabel {
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private let headerText: String?
    
    
    init(text: String?) {
        headerText = text
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
        
        text = headerText
        font = NewYorkFont.heavy.font(size: 21)
        textColor = .print
        numberOfLines = 0
    }
}
