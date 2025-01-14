//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Pawan Kumar Dhawan on 13/01/25.
//

import Foundation
import Alamofire

class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?
    @Published var error: CustomError?
    @Published var suggestions: [String] = []
    var weatherService = WeatherAPIService(session: Session())
    private let weatherInfoStorageManager: WeatherInfoStorageManager

    let delay: TimeInterval = 0.1
    private var task: Task<Void, Never>?
    
    init(weatherService:WeatherAPIService = WeatherAPIService(session: Session()), weatherInfoStorageManager: WeatherInfoStorageManager = WeatherInfoStorage()) {
        self.weatherService = weatherService
        self.weatherInfoStorageManager = weatherInfoStorageManager
    }
    
    func checkWeatherCache(forCity city: String) {
        let cachedWeather = weatherInfoStorageManager.getWeatherInfo(forCity: city)
        if let weather = cachedWeather, let savedDate = weather.timestamp {
            if shouldMakeAPICall(savedDate: savedDate) {
                makeAPICall(forCity: city)
            } else {
                //no api call needed
                DispatchQueue.main.async {
                    self.weather = weather
                    self.error = nil
                }
            }
        } else {
            //API call
            makeAPICall(forCity: city)
        }
    }
    
    func shouldMakeAPICall(savedDate: Date) -> Bool {
        let interval = Calendar.current.dateComponents([.hour], from: savedDate, to: Date())
        return  interval.hour ?? 0 >= WeatherForecast.cacheExpiryTime
    }
    
    

    func makeAPICall(forCity city: String) {
        weatherService.fetchWeather(forCity: city) { (weather, error)  in
            DispatchQueue.main.async {
                if let weather = weather {
                    self.weatherInfoStorageManager.cacheWeatherInfo(weather: weather)
                    self.weather = weather
                    self.error = nil
                } else if let error = error {
                    self.error = error
                    self.weather = nil
                }
            }
        }
    }
    
    func autocomplete(_ text: String) {
        guard !text.isEmpty else {
            suggestions = []
            task?.cancel()
            return
        }
        task?.cancel()
        task = Task {
            await Task.sleep(UInt64(delay * 1_000_000_000.0))
            guard !Task.isCancelled else {
                return
            }
            getCityList(forCity: text)
        }
    }
    
    func getCityList(forCity city: String) {
        weatherService.fetchCityList(forCity: city, completion: { (cityList, error) in
            DispatchQueue.main.async {
                if let cityList = cityList {
                    if self.isSingleSuggestion(cityList, equalTo: city) {
                        self.suggestions = []
                    } else {
                        self.suggestions = cityList
                    }
                } else if error != nil {
                    self.suggestions = []
                }
            }
        })
    }
    
    private func isSingleSuggestion(_ suggestions: [String], equalTo text: String) -> Bool {
        guard let suggestion = suggestions.first, suggestions.count == 1 else {
            return false
        }

        return suggestion.lowercased() == text.lowercased()
    }
}
