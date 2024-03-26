//
//  UIView+ext.swift
//  ChatApp
//
//  Created by mrgsdev on 26.03.2024.
//

import UIKit
extension UIView {
    
    func applyGradients(cornerRadius: CGFloat) {
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientView = GradientView(from: .topTrailing, to: .bottomLeading, startColor: UIColor(hex: 0xC9A1F0), endColor: UIColor(hex: 0x7AB2EB))
        if let gradientLayer = gradientView.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = self.bounds
            gradientLayer.cornerRadius = cornerRadius
            
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}
