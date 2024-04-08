//
//  TableCellViewModelType.swift
//  MVVM-2
//
//  Created by mrgsdev on 08.04.2024.
//

import Foundation

protocol TableViewCellViewModelType: AnyObject {
    var name: String { get }
    var secondName: String { get }
    var age: String { get }
}
