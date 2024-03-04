//
//  CurrenWeather.swift
//  WeatherAppAPI
//
//  Created by mrgsdev on 03.03.2024.
//

import Foundation

// MARK: - CurrentWeatherData

struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

// MARK: - Main
struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
}




