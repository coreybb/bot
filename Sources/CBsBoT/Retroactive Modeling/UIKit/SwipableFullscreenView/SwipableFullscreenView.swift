//
//  SwipableFullscreenView.swift
//  
//
//  Created by Corey Beebe on 9/10/21.
//

import UIKit


/// A UIView that allows users to easily swipe between  `childViews`. A `SwipableFullscreenView` allows a parent controller to retain its child controllers, and therefore observe and modify their state from a centralized class.
open class SwipableFullscreenView: UIView {
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private let collectionColor: UIColor
    private let childViews: [UIView]
    private let cellID: String = "i"
    private lazy var collectionView: FullscreenCollectionView = FullscreenCollectionView(view: self, cellViews: childViews)
    private lazy var dataSourceAndDelegate: FullscreenCollectionDataSourceAndDelegate = FullscreenCollectionDataSourceAndDelegate(cellID: cellID, cellViews: childViews)
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public init(childViews: [UIView], backgroundColor: UIColor = .cardWhite) {
        self.childViews = childViews
        collectionColor = backgroundColor
        super.init(frame: .zero)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        setupUI()
    }
    
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func setupUI() {
        
        backgroundColor = .cardWhite
        layoutUI()
        setupCollectionView()
    }
    
    
    private func layoutUI() {
        
        layoutCollectionView()
    }
    
    
    private func layoutCollectionView() {
        
        addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    
    private func setupCollectionView() {
        
        collectionView.register(FullscreenCollectionCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.delegate = dataSourceAndDelegate
        collectionView.dataSource = dataSourceAndDelegate
    }
}
