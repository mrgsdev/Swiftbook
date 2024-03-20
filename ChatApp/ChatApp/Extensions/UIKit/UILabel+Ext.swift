//
//  UILabel+Ext.swift
//  ChatApp
//
//  Created by mrgsdev on 20.03.2024.
//

import UIKit

extension UILabel{
    convenience init(text:String, font: UIFont? = .avenir20()) {
        self.init()
        self.text = text
        self.font = font
    }
}
