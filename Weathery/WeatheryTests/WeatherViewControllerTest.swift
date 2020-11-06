import XCTest
import CoreLocation

@testable import Weathery

class WeatherViewControllerTest: XCTestCase {

    var viewController: WeatherViewController!
    
    override func setUp() {
        viewController = WeatherViewController()
        viewController.loadViewIfNeeded()
    }
    
    func testCanGetWeatherAndPopulateView() {
        let weatherModel = WeatherModel(conditionId: 1, cityName: "Tokyo", temperature: 20)
        let mockWeatherService = WeatherServiceMock(delegate: viewController, weatherModel: weatherModel, error: nil)
        viewController.weatherService = mockWeatherService

        mockWeatherService.fetchWeather(cityName: "Tokyo")
        
        XCTAssertEqual("Tokyo", viewController.cityLabel.text)
        XCTAssertEqual("20°C", viewController.temperatureLabel.attributedText?.string)
    }
    
    func testCanHandleGeneralErrors() {
        let error = ServiceError.general(reason: "Internet down")
        let mockWeatherService = WeatherServiceMock(delegate: viewController, weatherModel: nil, error: error)
        viewController.weatherService = mockWeatherService

        mockWeatherService.fetchWeather(cityName: "Tokyo")
        
        XCTAssertEqual("Internet down", viewController.errorMessage!)
    }
    
    func testNetworkErrors() {
        let error = ServiceError.network(statusCode: 404)
        let mockWeatherService = WeatherServiceMock(delegate: viewController, weatherModel: nil, error: error)
        viewController.weatherService = mockWeatherService
        
        mockWeatherService.fetchWeather(cityName: "Tokyo")
        
        XCTAssertEqual("Networking error. Status code: 404", viewController.errorMessage!)
    }
    
    func testParsingErrors() {
        let error = ServiceError.parsing
        let mockWeatherService = WeatherServiceMock(delegate: viewController, weatherModel: nil, error: error)
        viewController.weatherService = mockWeatherService
        
        mockWeatherService.fetchWeather(cityName: "Tokyo")
        
        XCTAssertEqual("JSON weather data could not be parsed.", viewController.errorMessage!)
    }
}

struct WeatherServiceMock: WeatherServiceProtocol {
    
    weak var delegate: WeatherServiceDelegate?
    
    var weatherModel: WeatherModel?
    var error: ServiceError?
    
    func fetchWeather(cityName: String) {
        fetch()
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        fetch()
    }
    
    func fetch() {
        if let error = error {
            delegate?.didFailWithError(self, error)
            return
        }

        guard let weatherModel = weatherModel else { return }
        delegate?.didFetchWeather(self, weatherModel)
    }
}
