//
//  UIStackView+Ext.swift
//  ChatApp
//
//  Created by mrgsdev on 20.03.2024.
//

import UIKit
extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        
        self.axis = axis
        self.spacing = spacing
    }
    
}
