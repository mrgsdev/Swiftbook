//
//  TableViewModelType.swift
//  MVVM-2
//
//  Created by mrgsdev on 08.04.2024.
//

import Foundation

protocol TableViewViewModelType {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath: IndexPath) -> TableViewCellViewModelType?
}
