//
//  UIColor+Ext.swift
//  ChatApp
//
//  Created by mrgsdev on 20.03.2024.
//

import UIKit


extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex: Int) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
    
    static func buttonRed() -> UIColor {
        return UIColor(hex: 0xD0021B)
    }
    
    static func mainWhite() -> UIColor {
        return UIColor(hex: 0xF7F8FD)
    }
    
    static func buttonDark() -> UIColor {
        return UIColor(hex: 0x333333)
    }
    
    static func textFieldLight() -> UIColor {
        return UIColor(hex: 0xE6E6E6)
    }
}
