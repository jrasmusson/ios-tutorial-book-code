import XCTest
@testable import Weathery

class WeatherDataTest: XCTestCase {

    func testCanParseWeather() throws {
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

        let jsonData = json.data(using: .utf8)!
        let weatherData = try! JSONDecoder().decode(WeatherData.self, from: jsonData)
        
        XCTAssertEqual(10.58, weatherData.main.temp)
        XCTAssertEqual("Calgary", weatherData.name)
        XCTAssertEqual(804, weatherData.weather[0].id)
        XCTAssertEqual("overcast clouds", weatherData.weather[0].description)
    }
    
    func testCanParseWeatherWithEmptyCityName() throws {
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
               "name": ""
             }
            """

            let jsonData = json.data(using: .utf8)!
            let weatherData = try! JSONDecoder().decode(WeatherData.self, from: jsonData)
            
            XCTAssertEqual("", weatherData.name)
        }
    
    func testCanParseWeatherViaJSONFile() throws {

            guard let pathString = Bundle(for: type(of: self)).path(forResource: "weather", ofType: "json") else {
                fatalError("json not found")
            }

            print("\n\n\(pathString)\n\n")
            
            guard let json = try? String(contentsOfFile: pathString, encoding: .utf8) else {
                        fatalError("Unable to convert json to String")
            }

            let jsonData = json.data(using: .utf8)!
            let weatherData = try! JSONDecoder().decode(WeatherData.self, from: jsonData)
            
            XCTAssertEqual(25.65, weatherData.main.temp)
            XCTAssertEqual("Paris", weatherData.name)
        }
}
