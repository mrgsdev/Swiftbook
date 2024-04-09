//
//  ViewModel.swift
//  MVVM-2
//
//  Created by mrgsdev on 08.04.2024.
//

import Foundation

class ViewModel:TableViewViewModelType {
    
    private var selectedIndexPath: IndexPath?
    
    
    var profiles = [
        Profile(name: "John", secondName: "Smith", age: 33),
        Profile(name: "Max", secondName: "Kolvy", age: 21),
        Profile(name: "Mark", secondName: "Salmon", age: 52)
    ]
    
    func numberOfRows() -> Int{
        return profiles.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile:profile)
    }
    
    func viewModelForSelectedRow() -> DetailViewViewModelType? {
        guard let selectedIndexPath else { return nil }
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
    
    func selectRow(forIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}
