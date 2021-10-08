//
//  GradientDirection.swift
//  
//
//  Created by Corey Beebe on 10/8/21.
//


import UIKit


public enum GradientDirection {
    
    
    case leftToRight
    case topToBottom
    case topLeftToBottomRight
    case topRightToBottomLeft
    
    
    //------------------------------
    //  MARK: - Internal Properties
    //------------------------------
    var startPoint: CGPoint {
        CGPoint(x: startPointX, y: startPointY)
    }
    
    var endPoint: CGPoint {
        CGPoint(x: endPointX, y: endPointY)
    }
    
    
    //-----------------------------
    //  MARK: - Private Properties
    //-----------------------------
    private var startPointX: Int {
        
        switch self {
        case .leftToRight: return 0
        case .topToBottom: return 1
        case .topLeftToBottomRight: return 0
        case .topRightToBottomLeft: return 0
        }
    }
    
    private var startPointY: Int {
        
        switch self {
        case .leftToRight: return 1
        case .topToBottom: return 0
        case .topLeftToBottomRight: return 0
        case .topRightToBottomLeft: return 1
        }
    }
    
    private var endPointX: Int { 1 }
    
    private var endPointY: Int {
        
        switch self {
        case .topRightToBottomLeft: return 0
        default: return 1
        }
    }
}
