//
//  EquallyDistributedHorizontalStackView.swift
//  
//
//  Created by Corey Beebe on 10/11/21.
//

import UIKit


open class EquallyDistributedHorizontalStackView: UIStackView {
    
    public init(subviews: [UIView], spacing: CGFloat = 16) {
        super.init(frame: .zero)
        subviews.forEach { addArrangedSubview($0) }
        self.spacing = spacing
        distribution = .fillEqually
        axis = .horizontal
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
