//
//  NetworkWeatherManager.swift
//  WeatherAppAPI
//
//  Created by mrgsdev on 03.03.2024.
//

import Foundation
let apiKey = "aa3f365e831f00e797050758578c8aa3" // a new key is generated in 45 minutes
struct NetworkWeatherManager {
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                 parseJSON(withData: data)
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) {
        let decoder = JSONDecoder()
        
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            print(currentWeatherData.name)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
