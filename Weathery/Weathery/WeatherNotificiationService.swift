//
//  WeatherNotificiationService.swift
//  Weathery
//
//  Created by jrasmusson on 2020-10-20.
//

import Foundation

extension Notification.Name {
    static let didReceiveWeather = Notification.Name("didReceiveWeather")
}

struct WeatherNotificationService {
    
    func fetchWeather(cityName: String) {
        let weatherModel = WeatherModel(conditionId: 200, cityName: cityName, temperature: 22)
        let data = ["currentWeather": weatherModel]
        NotificationCenter.default.post(name: .didReceiveWeather, object: self, userInfo: data)
    }
}
