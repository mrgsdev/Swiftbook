//
//  Course.swift
//  ImageApp
//
//  Created by mrgsdev on 12.03.2024.
//

import Foundation
struct Course: Decodable {
    
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
}
