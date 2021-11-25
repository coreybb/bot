//
//  EquallyDistributedVerticalStackView.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


public class EquallyDistributedVerticalStackView: UIStackView {
    
    public init(subviews: [UIView], spacing: CGFloat = 16) {
        super.init(frame: .zero)
        subviews.forEach { addArrangedSubview($0) }
        self.spacing = spacing
        distribution = .fillEqually
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
