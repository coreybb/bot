//
//  DarkTranslucentPillButton.swift
//  
//
//  Created by Corey Beebe on 9/6/21.
//

import UIKit


public class DarkTranslucentPillButton: UIButton {
    

    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        setupUI()
    }
    
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func setupUI() {
        
        backgroundColor = .black.withAlphaComponent(0.5)
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.white, for: .normal)
        titleLabel?.font = MrEavesFont.bold.font(size: 18)
        layer.cornerRadius = frame.height / 2
    }
}
