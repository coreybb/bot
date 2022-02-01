//
//  SwipableFullscreenView.swift
//
//
//  Created by Corey Beebe on 9/10/21.
//

import UIKit


/// A UIView that allows users to easily swipe between  `childViews`. A `SwipableFullscreenView` allows a parent controller to retain its child controllers, and therefore observe and modify their state from a centralized class.
open class SwipableFullscreenView: View {
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private let collectionColor: UIColor
    private let childViews: [UIView]
    private let cellID: String = "i"
    private lazy var collectionView: FullscreenCollectionView = FullscreenCollectionView(view: self, cellViews: childViews)
    private let collectionUserInteractionEnabled: Bool
    private lazy var didLayoutSubviews: Bool = false
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public init(childViews: [UIView], backgroundColor: UIColor = .white, userInteractionEnabled: Bool = true) {
        self.childViews = childViews
        collectionColor = backgroundColor
        collectionUserInteractionEnabled = userInteractionEnabled
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
        
        if didLayoutSubviews { return }
        setupUI()
        didLayoutSubviews = true
    }
    
    
    
    //---------------------
    //  MARK: - Public API
    //---------------------
    public func scrollToView(at index: Int) {
        
        
        
        guard (index <= childViews.count - 1) &&
                (index >= 0) else {
            print("The SwipableFullScreenView has no child view at index \(index), and is unable to scroll!")
            return
        }
        
        collectionView.isScrollEnabled = true
        let indexPath: IndexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        collectionView.isScrollEnabled = false
    }
    
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func setupUI() {
        
        backgroundColor = .clear
        layoutCollectionView()
        setupCollectionView()
    }
    
    
    private func layoutCollectionView() {
        
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    
    private func setupCollectionView() {
        
//        collectionView.allowsSelection = false
//        collectionView.isUserInteractionEnabled = collectionUserInteractionEnabled
        collectionView.isScrollEnabled = false
        collectionView.register(FullscreenCollectionCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = collectionColor
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}



extension SwipableFullscreenView: UICollectionViewDelegate, UICollectionViewDataSource {
    

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        childViews.count
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: FullscreenCollectionCell = collectionView
            .dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FullscreenCollectionCell
        cell.hostedView = childViews[indexPath.item]
        return cell
    }
}
