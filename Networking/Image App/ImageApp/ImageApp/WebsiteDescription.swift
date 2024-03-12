//
//  WebsiteDescription.swift
//  ImageApp
//
//  Created by mrgsdev on 12.03.2024.
//

import Foundation

struct WebsiteDescription: Decodable {
    
    let websiteDescription: String?
    let websiteName: String?
    let courses: [Course]
}
