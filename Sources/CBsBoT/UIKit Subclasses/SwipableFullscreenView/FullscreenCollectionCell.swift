//
//  FullscreenCollectionCell.swift
//  
//
//  Created by Corey Beebe on 9/10/21.
//

import UIKit


class FullscreenCollectionCell: UICollectionViewCell {
    

    //----------------------------
    //  MARK: - Public Properties
    //----------------------------
    var hostedView: UIView? {
        didSet { setupHostedView() }
    }
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func setupCell() {
        
        contentView.clipsToBounds = false // ?
        backgroundColor = .clear
//        contentView.layer.cornerRadius = 16 // ?
        contentView.layer.masksToBounds = true
    }
    
    
    private func setupHostedView() {
        
        guard let hostedView = hostedView else { return }
        hostedView.frame = contentView.bounds
        hostedView.clipsToBounds = false
        contentView.addSubview(hostedView)
    }
}
