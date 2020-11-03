import UIKit

// https://api.openweathermap.org/data/2.5/weather?appid=ce5edb27133f4b3a9eab5abfe8072942&units=metric&q=Calgary

let json = """
 {
   "weather": [
     {
       "id": 804,
       "description": "overcast clouds",
     }
   ],
   "main": {
     "temp": 10.58,
   },
   "name": "Calgary"
 }
"""

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

let jsonData = json.data(using: .utf8)!
let result = try! JSONDecoder().decode(WeatherData.self, from: jsonData)

result
result.weather
result.main
result.name
