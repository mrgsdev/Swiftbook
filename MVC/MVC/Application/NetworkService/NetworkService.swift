//
//  NetworkService.swift
//  MVC
//
//  Created by mrgsdev on 19.03.2024.
//

import Foundation

class NetworkService {
    private init() {}
    static let shared = NetworkService()
    
    public func getData(url:URL, completion: @escaping (Any) -> ()){
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            guard let data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
}
