//
//  ScrollableGraphViewDataSource.swift
//  
//
//  Created by Corey Beebe on 1/30/22.
//

import UIKit


public protocol ScrollableGraphViewDataSource: AnyObject {
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double
    func label(atIndex pointIndex: Int) -> String
    func numberOfPoints() -> Int // This now forces the same number of points in each plot.
}
