//
//  NetworkManager.swift
//  MVVM-3
//
//  Created by mrgsdev on 09.04.2024.
//

import Foundation

class NetworkManager: NSObject {
    
    func fetchMovies(completion: ([String]) -> ()) {
        completion(["Movie 1", "Movie 2", "Movie 3"])
    }
}
