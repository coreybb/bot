//
//  ImageView.swift
//  
//
//  Created by Corey Beebe on 11/23/21.
//

import UIKit


/// A simplified UIImageView subclass for quick instantiation and minimal configuration.
open class ImageView: UIImageView {
    
    
    public init(image: UIImage, contentMode: ContentMode = .scaleAspectFit, clipsToBounds: Bool = true) {
        super.init(image: image.withRenderingMode(.alwaysOriginal))
        
        self.contentMode = contentMode
        self.clipsToBounds = clipsToBounds
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
