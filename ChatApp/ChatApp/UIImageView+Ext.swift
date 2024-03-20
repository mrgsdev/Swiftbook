//
//  UIImageView+Ext.swift
//  ChatApp
//
//  Created by mrgsdev on 20.03.2024.
//

import UIKit
enum ImageLiteral:String {
    case logo = "Logo"
    case avatar = "avatar"
    case googleLogo = "googleLogo"
    case plus = "plus"
    case sent = "Sent"
    case tabBarLogo = "tabBarLogo"
}

extension UIImageView{
    convenience init(image:UIImage?,contentMode:UIView.ContentMode) {
        self.init()
        self.image = image
        self.contentMode = contentMode
    }
}
