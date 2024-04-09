//
//  DetailViewModel.swift
//  MVVM-2
//
//  Created by mrgsdev on 09.04.2024.
//

import Foundation

class DetailViewModel: DetailViewViewModelType {
    var profile:Profile
    var description: String {
        return profile.name + " " + profile.secondName + " " + "\(profile.age)"
    }
    init(profile: Profile) {
        self.profile = profile
    }
    
}
