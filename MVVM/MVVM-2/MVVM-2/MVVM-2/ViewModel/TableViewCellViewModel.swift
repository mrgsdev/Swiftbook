//
//  TableViewCellModel.swift
//  MVVM-2
//
//  Created by mrgsdev on 08.04.2024.
//

import Foundation
class TableViewCellViewModel: TableViewCellViewModelType {
    private var profile: Profile
    
    var name: String {
        return profile.name
    }
    
    var secondName: String {
        return profile.secondName
    }
    
    var age: String {
        return String(describing: profile.age)
    }
    
    init(profile: Profile) {
        self.profile = profile
    }

}
