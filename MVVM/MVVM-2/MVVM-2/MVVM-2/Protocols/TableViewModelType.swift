//
//  TableViewModelType.swift
//  MVVM-2
//
//  Created by mrgsdev on 08.04.2024.
//

import Foundation

protocol TableViewModelType {
    var numberOfRows:Int { get }
    var profiles: [Profile] { get }
}
