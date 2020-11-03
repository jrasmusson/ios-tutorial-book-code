//
//  WeatherData.swift
//  Weathery
//
//  Created by jrasmusson on 2020-10-24.
//

import Foundation

struct WeatherData: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Weather: Codable {
    let id: Int
    let description: String
}

struct Main: Codable {
    let temp: Double
}
