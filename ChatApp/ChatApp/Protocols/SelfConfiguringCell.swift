//
//  SelfConfiguringCell.swift
//  ChatApp
//
//  Created by mrgsdev on 24.03.2024.
//

import UIKit

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}
