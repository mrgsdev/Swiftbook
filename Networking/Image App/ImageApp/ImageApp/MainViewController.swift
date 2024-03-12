//
//  MainViewController.swift
//  ImageApp
//
//  Created by mrgsdev on 12.03.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBAction func getRequest(_ sender: Any) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            guard let response, let data else { return }
            
            print("response \(response)")
            print("data \(data)")
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("json \(json)")
            } catch {
                print("error \(error)")
            }
        }.resume()
    }
    
    @IBAction func postRequest(_ sender: Any) {
    }

}
