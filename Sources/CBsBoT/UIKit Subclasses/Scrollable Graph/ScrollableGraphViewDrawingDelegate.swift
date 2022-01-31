//
//  ScrollableGraphViewDrawingDelegate.swift
//  
//
//  Created by Corey Beebe on 1/30/22.
//

import UIKit


// Delegate definition that provides the data required by the drawing layers.
internal protocol ScrollableGraphViewDrawingDelegate: AnyObject {
func intervalForActivePoints() -> CountableRange<Int>
func rangeForActivePoints() -> (min: Double, max: Double)
func paddingForPoints() -> (leftmostPointPadding: CGFloat, rightmostPointPadding: CGFloat)
func calculatePosition(atIndex index: Int, value: Double) -> CGPoint
func currentViewport() -> CGRect
func updatePaths()
}
