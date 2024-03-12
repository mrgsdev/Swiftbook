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
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let userData = ["Course": "Networking", "Lesson": "GET and POST"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            guard let response, let data else { return }
            
            print("response POST \(response)")
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("json  POST \(json)")
            } catch {
                print("error POST \(error)")
            }
        } .resume()
    }

}
