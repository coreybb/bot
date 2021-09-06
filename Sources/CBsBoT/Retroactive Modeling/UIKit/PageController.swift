//
//  PageController.swift
//  
//
//  Created by Corey Beebe on 9/5/21.
//

import UIKit


public class PageController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private let controllers: [UIViewController]
    private let shouldUseInfiniteScroll: Bool
    
    
    //---------------
    //  MARK: - Init
    //---------------
    public init(controllers: [UIViewController], shouldUseInfiniteScroll: Bool = true) {
        self.controllers = controllers
        self.shouldUseInfiniteScroll = shouldUseInfiniteScroll
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    public override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self
        configureAppearance()
    }
    
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configureSubviews()
    }
    
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    private func configureAppearance() {
        
        if let firstPageDisplayed: UIViewController = controllers.first {
            
            setViewControllers([firstPageDisplayed],
                               direction: .forward,
                               animated: true, completion: nil)
        }
        
        let controlAppearance: UIPageControl = UIPageControl.appearance()
        controlAppearance.pageIndicatorTintColor = .lightGray
        controlAppearance.currentPageIndicatorTintColor = .darkGray
    }
    
    
    private func configureSubviews() {
        
        let _ = view.subviews.map {
            
            if $0 is UIScrollView {
                
                $0.frame = UIScreen.main.bounds
                
            } else if $0 is UIPageControl {
                
                $0.backgroundColor = .clear
            }
        }
    }

    
    
    //-------------------------------
    //  MARK: - Protocol Conformance
    //-------------------------------
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex: Int = controllers.firstIndex(of: viewController)
            else { return nil }
        
        let previousIndex: Int = viewControllerIndex - 1
        
        if isFirstController(previousIndex) {
            switch shouldUseInfiniteScroll {
            case true: return controllers.last
            case false: return nil
            }
        }
        
        guard controllers.count > previousIndex
            else { return nil }
        
        return controllers[previousIndex]
    }
    
    
    private func isFirstController(_ previousIndex: Int) -> Bool {
        previousIndex < 0
    }
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex: Int = controllers.firstIndex(of: viewController)
            else { return nil }
        
        let subsequentIndex: Int = viewControllerIndex + 1
        
        if isLastController(subsequentIndex) {
            switch shouldUseInfiniteScroll {
            case true: return controllers.first
            case false: return nil
            }
        }
        
        guard controllers.count > subsequentIndex
            else { return nil }
        
        return controllers[subsequentIndex]
    }
    
    
    private func isLastController(_ subsequentIndex: Int) -> Bool {
        subsequentIndex >= controllers.count
    }
    
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        controllers.count
    }
    
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        guard let firstViewController: UIViewController = viewControllers?.first,
              let firstViewControllerIndex: Int = controllers.firstIndex(of: firstViewController)
            else { return 0 }
        
        return firstViewControllerIndex
    }
}
