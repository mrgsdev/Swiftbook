//
//  SegmentedControl + Extension.swift
//  ChatApp
//
//  Created by mrgsdev on 21.03.2024.
//

import UIKit
extension UISegmentedControl {
    
    convenience init(first: String, second: String) {
        self.init()
        self.insertSegment(withTitle: first, at: 0, animated: true)
        self.insertSegment(withTitle: second, at: 1, animated: true)
        self.selectedSegmentIndex = 0
    }
}
