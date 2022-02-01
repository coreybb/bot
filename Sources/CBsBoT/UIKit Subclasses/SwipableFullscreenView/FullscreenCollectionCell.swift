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
        
        backgroundColor = .clear
        contentView.clipsToBounds = false // ?
//        contentView.layer.cornerRadius = 16 // ?
        contentView.layer.masksToBounds = true
    }
    
    
    private func setupHostedView() {
        
        guard let hostedView = hostedView else { return }
        addSubview(hostedView)
        hostedView.translatesAutoresizingMaskIntoConstraints = false
        hostedView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        hostedView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        hostedView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        hostedView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
