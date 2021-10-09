//
//  UIImage.swift
//  Tab
//
//  Created by corey on 6/19/21.
//

import UIKit


public extension UIImage {
    

    enum Direction { case horizontal, vertical }
    
    func withLinearGradientTint(colors: [CGColor], direction: Direction = .horizontal) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            print("Unable to render an image with a gradient tint.")
            return self
        }
        
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1, y: -1)
        context.setBlendMode(.normal)
        
        let rect: CGRect = CGRect.init(x: 0, y: 0,
                                       width: size.width, height: size.height)

        // Create gradient
        let colors = colors as CFArray
        let space = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: space, colors: colors, locations: nil)

        // Apply gradient
        context.clip(to: rect, mask: cgImage!)
        let endPointX = (direction == .horizontal) ? size.width : 0
        let endPointY = (direction == .horizontal) ? 0 : size.height
        
        context.drawLinearGradient(gradient!,
                                   start: CGPoint(x: 0, y: 0),
                                   end: CGPoint(x: endPointX, y: endPointY),
                                   options: .drawsAfterEndLocation)

        
        let gradientImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return gradientImage
    }
    
    
    var compressedData: Data? {
    
        guard let imageData: Data = self.jpegData(compressionQuality: 100) else { return nil }
            
        let twentyMegabytes: Int = 20_000_000
        let tenMegabytes: Int = 10_000_000
        let twoMegabytes: Int = 2_000_000
        let oneMegabyte: Int = 1_000_000
        let fiveHundredKilobytes: Int = 500_000
        
        switch imageData.count {
        case let size where size >= twentyMegabytes: return self.jpeg(.lowest)!
        case let size where size >= tenMegabytes: return self.jpeg(.low)!
        case let size where size >= twoMegabytes: return self.jpeg(.medium)!
        case let size where size >= oneMegabyte: return self.jpeg(.high)!
        case let size where size >= fiveHundredKilobytes: return self.jpeg(.high)!
        default: return self.jpeg(.highest)!
        }
    }
    
    //-----------------------
    //  MARK: - Private API
    //-----------------------
    private enum JPEGQuality: CGFloat {
        
        case lowest  = 0.0077
        case low     = 0.02
        case medium  = 0.06
        case high    = 0.18
        case highest = 1
    }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    private func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        jpegData(compressionQuality: jpegQuality.rawValue)
    }
}
