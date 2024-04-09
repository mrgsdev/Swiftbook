//
//  ViewModel.swift
//  MVVM-3
//
//  Created by mrgsdev on 09.04.2024.
//

import Foundation
class ViewModel: NSObject {
    
    @IBOutlet weak var networkManager: NetworkManager!
    
    
    private var movies: [String]?
    
    func fetchMovies(completion: @escaping() -> ()) {
        networkManager.fetchMovies { [weak self] movies in
            self?.movies = movies
            completion()
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return movies?.count ?? 0
    }
    
    func titleForCell(atIndexPath indexPath: IndexPath) -> String {
        guard let movies = movies else { return "" }
        return movies[indexPath.row]
    }
}
