//
//  ImageProperties.swift
//  ImageApp
//
//  Created by mrgsdev on 12.03.2024.
//
 
import UIKit

struct ImageProperties {
    
    let key: String
    let data: Data
    
    init?(withImage image: UIImage, forKey key: String) {
        self.key = key
        guard let data = image.pngData() else { return nil }
        self.data = data
    }
}
