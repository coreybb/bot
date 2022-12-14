//
//  StretchHeaderController.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


open class StretchHeaderController: UIViewController {
    
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private let stretchView: UIView
    private let contentView: UIView
    private let headerViewHeight: CGFloat
    private let headerID: String = "h"
    private let contentCellID: String = "i"
    private lazy var collectionView: UICollectionView = {

        let layout: StretchHeaderLayout = StretchHeaderLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let view: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public init(headerView: UIView, contentView: UIView, headerViewHeight: CGFloat = 700) {
        self.stretchView = headerView
        self.contentView = contentView
        self.headerViewHeight = headerViewHeight
        super.init(nibName: nil, bundle: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        layoutCollectionView()
        setupCollectionView()
    }
    
    
    required public init?(coder: NSCoder) {
        fatalError()
    }

    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func layoutCollectionView() {
        
        view.addSubview(collectionView)
        collectionView.fillSuperview()
    }
    
    
    private func setupCollectionView() {
        
        collectionView.register(StretchHeaderCollectionCell.self, forCellWithReuseIdentifier: contentCellID)
        collectionView.register(CollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}



//--------------------------------------------------
//  MARK: - CollectionView Data Source and Delegate
//--------------------------------------------------
extension StretchHeaderController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellID, for: indexPath) as! StretchHeaderCollectionCell
        cell.childView = contentView
        return cell
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let reusableHeader: CollectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                         withReuseIdentifier: headerID,
                                                                                         for: indexPath) as! CollectionHeader
        reusableHeader.childView = stretchView
        return reusableHeader
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        //  TODO: - Allow for dynamic sizing, to supplement developer customization.
        var headerHeight: CGFloat {
            211
//            switch currentDevice {
//            case .iPad7_9Or9_7, .iPad10_5, .iPad12_9: return 200
//            default: return 222
//            }
        }
        
        return CGSize(width: collectionView.bounds.width, height: headerViewHeight)
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //  TODO: - What the fuck is this?
        CGSize(width: view.bounds.width, height: 700)
    }
}
