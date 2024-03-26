//
//  UIImageView+Ext.swift
//  ChatApp
//
//  Created by mrgsdev on 20.03.2024.
//

import UIKit


extension UIImageView{
    convenience init(image: UIImage.ImageLiteral,contentMode:UIView.ContentMode) {
        self.init()
        self.image = UIImage(named: image.rawValue)
        self.contentMode = contentMode
    }
}

// UIImageView(image:UIImage(named: UIImage.ImageLiteral.logo.rawValue), contentMode: .scaleAspectFit)

extension UIImage {
    enum ImageLiteral:String {
        case logo = "Logo"
        case avatar = "avatar"
        case googleLogo = "googleLogo"
        case plus = "plus"
        case sent = "Sent"
        case tabBarLogo = "tabBarLogo"
        case humanTwo = "human2"
    }
}

extension UIImageView {
  func setupColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
