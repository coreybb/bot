//
//  FullscreenCollectionDataSourceAndDelegate.swift
//  
//
//  Created by Corey Beebe on 9/10/21.
//

import UIKit



class FullscreenCollectionDataSourceAndDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private let cellViews: [UIView]
    private let cellID: String
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    init(cellID: String, cellViews: [UIView]) {
        self.cellViews = cellViews
        self.cellID = cellID
    }
    
    
    
    //-----------------------
    //  MARK: - Internal API
    //-----------------------
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellViews.count
    }
    
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: FullscreenCollectionCell = collectionView
            .dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FullscreenCollectionCell
        cell.hostedView = cellViews[indexPath.item]
        return cell
    }
}
