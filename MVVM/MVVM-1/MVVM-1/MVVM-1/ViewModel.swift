//
//  ViewModel.swift
//  MVVM-1
//
//  Created by mrgsdev on 07.04.2024.
//

import Foundation

class ViewModel {
    
    private var profile = Profile(name: "John", secondName: "Smith", age: 23)
    
    var name: String{
        return profile.name
    }
    
    var secondName: String{
        return profile.secondName
    }
    
    var age: String {
        return String(describing: profile.age)
    }
   
}
