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
    public init(headerView: UIView, contentView: UIView) {
        self.stretchView = headerView
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required public init?(coder: NSCoder) {
        fatalError()
    }
    
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutCollectionView()
        setupCollectionView()
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
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
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
        
        let reusableHeader: HeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                         withReuseIdentifier: headerID,
                                                                                         for: indexPath) as! HeaderView
        reusableHeader.childView = stretchView
        return reusableHeader
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        //  TODO: - Make dynamic.
        var headerHeight: CGFloat {
            211
//            switch currentDevice {
//            case .iPad7_9Or9_7, .iPad10_5, .iPad12_9: return 200
//            default: return 222
//            }
        }
        
        return CGSize(width: collectionView.bounds.width, height: headerHeight)
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //  TODO: - Expose API to allow developer to customize
        CGSize(width: view.bounds.width, height: 700)
    }
}
