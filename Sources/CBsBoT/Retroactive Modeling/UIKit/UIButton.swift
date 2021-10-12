//
//  UIButton.swift
//  
//
//  Created by Corey Beebe on 10/12/21.
//

import UIKit


public extension UIButton {
    
  func alignVertical(spacing: CGFloat = 6.0) {
    guard let imageSize = imageView?.image?.size,
          let text: String = titleLabel?.text,
          let font: UIFont = titleLabel?.font
    else { return }

    titleEdgeInsets = UIEdgeInsets(
      top: 0.0,
      left: -imageSize.width,
      bottom: -(imageSize.height + spacing),
      right: 0.0
    )

    let titleSize = text.size(withAttributes: [.font: font])
    imageEdgeInsets = UIEdgeInsets(
      top: -(titleSize.height + spacing),
      left: 0.0,
      bottom: 0.0, right: -titleSize.width
    )

    let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0
    contentEdgeInsets = UIEdgeInsets(
      top: edgeOffset,
      left: 0.0,
      bottom: edgeOffset,
      right: 0.0
    )
  }
    
    
    func show() {
        UIView.animate(withDuration: 0.44) {
            [unowned self] in
            self.alpha = 0.95
        }
    }
    
    
    func hide() {
        UIView.animate(withDuration: 0.44) {
            [unowned self] in
            self.alpha = 0
        }
    }
}
