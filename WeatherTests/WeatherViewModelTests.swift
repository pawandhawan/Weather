//
//  WeatherViewModelTests.swift
//  WeatherTests
//
//  Created by Pawan Kumar Dhawan on 13/01/25.
//

import XCTest
@testable import Weather

final class WeatherViewModelTests: XCTestCase {

    func testForFetchWeatherSuccessCase() {
        let mockSession = MockSession()
        let mockAPIService = MockWeatherAPIService(session: mockSession)
        mockAPIService.isForSuccess = true
        let weatherViewModel = WeatherViewModel(weatherService: mockAPIService)
    }
    
    func testForShouldMakeAPICallWhenCacheNotExpired() {
        let mockSession = MockSession()
        let mockAPIService = MockWeatherAPIService(session: mockSession)
        mockAPIService.isForSuccess = true
        let mockStoargeManager = MockWeatherInfoStorageManager()
        let weatherViewModel = WeatherViewModel(weatherService: mockAPIService, weatherInfoStorageManager: mockStoargeManager)
        let earlyDate = Calendar.current.date(
          byAdding: .hour,
          value: -3,
          to: Date())
        let isNeedToMakeAPICall = weatherViewModel.shouldMakeAPICall(savedDate: earlyDate!)
        XCTAssertFalse(isNeedToMakeAPICall)
    }
    
    func testForShouldMakeAPICallWhenCacheExpired() {
        let mockSession = MockSession()
        let mockAPIService = MockWeatherAPIService(session: mockSession)
        mockAPIService.isForSuccess = true
        let mockStoargeManager = MockWeatherInfoStorageManager()
        let weatherViewModel = WeatherViewModel(weatherService: mockAPIService, weatherInfoStorageManager: mockStoargeManager)
        let earlyDate = Calendar.current.date(
          byAdding: .hour,
          value: -7,
          to: Date())
        let isNeedToMakeAPICall = weatherViewModel.shouldMakeAPICall(savedDate: earlyDate!)
        XCTAssertTrue(isNeedToMakeAPICall)
    }
    
    func testForCheckWeatherCacheWithNoCache() {
        let mockSession = MockSession()
        let mockAPIService = MockWeatherAPIService(session: mockSession)
        mockAPIService.isForSuccess = true
        let mockStoargeManager = MockWeatherInfoStorageManager()
        mockStoargeManager.isCacheAvailable = false
        let weatherViewModel = WeatherViewModel(weatherService: mockAPIService, weatherInfoStorageManager: mockStoargeManager)
        
        weatherViewModel.checkWeatherCache(forCity: "Delhi")
        XCTAssertTrue(mockAPIService.isFetchWeatherCalled)
    }
    
    func testForCheckWeatherCacheWithCache() {
        let mockSession = MockSession()
        let mockAPIService = MockWeatherAPIService(session: mockSession)
        mockAPIService.isForSuccess = true
        let mockStoargeManager = MockWeatherInfoStorageManager()
        mockStoargeManager.isCacheAvailable = true
        let weatherViewModel = WeatherViewModel(weatherService: mockAPIService, weatherInfoStorageManager: mockStoargeManager)
        
        weatherViewModel.checkWeatherCache(forCity: "Delhi")
        XCTAssertFalse(mockAPIService.isFetchWeatherCalled)
    }
    
    func testForCheckWeatherCacheWithExpiredCache() {
        let mockSession = MockSession()
        let mockAPIService = MockWeatherAPIService(session: mockSession)
        mockAPIService.isForSuccess = true
        let mockStoargeManager = MockWeatherInfoStorageManager()
        mockStoargeManager.isCacheAvailable = true
        let weatherViewModel = WeatherViewModel(weatherService: mockAPIService, weatherInfoStorageManager: mockStoargeManager)
        
        weatherViewModel.checkWeatherCache(forCity: "Delhi")
        XCTAssertFalse(mockAPIService.isFetchWeatherCalled)
    }

}
