//
//  WeatherClosureService.swift
//  Weathery
//
//  Created by jrasmusson on 2020-10-21.
//

import Foundation

struct WeatherClosureService {
    
    var receivedWeatherHandler: ((WeatherModel) -> Void)?
    
    func fetchWeather(cityName: String) {
        guard let receivedWeatherHandler = receivedWeatherHandler else { return }
        let weatherModel = WeatherModel(conditionId: 600, cityName: "Stockholm", temperature: -10)
        receivedWeatherHandler(weatherModel)
    }

}
