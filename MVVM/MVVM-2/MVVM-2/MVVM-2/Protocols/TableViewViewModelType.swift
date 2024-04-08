//
//  TableViewModelType.swift
//  MVVM-2
//
//  Created by mrgsdev on 08.04.2024.
//

import Foundation

protocol TableViewViewModelType {
    var numberOfRows:Int { get } 
    func cellViewModel(forIndexPath: IndexPath) -> TableViewCellViewModelType?
}
