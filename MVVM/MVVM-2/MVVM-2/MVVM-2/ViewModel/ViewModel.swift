//
//  ViewModel.swift
//  MVVM-2
//
//  Created by mrgsdev on 08.04.2024.
//

import Foundation

class ViewModel:TableViewModelType {
    var profiles = [
        Profile(name: "John", secondName: "Smith", age: 33),
        Profile(name: "Max", secondName: "Kolvy", age: 21),
        Profile(name: "Mark", secondName: "Salmon", age: 52)
    ]
    
    var numberOfRows: Int {
        return profiles.count
    }
}
