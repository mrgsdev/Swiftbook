//
//  User.swift
//  TODO
//
//  Created by mrgsdev on 02.03.2024.
//

import Foundation
import Firebase

struct Users {
    
    let uid: String
    let email: String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email!
    }
}
