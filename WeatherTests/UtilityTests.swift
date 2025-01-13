//
//  UtilityTests.swift
//  WeatherTests
//
//  Created by Pawan Kumar Dhawan on 13/01/25.
//

import XCTest
@testable import Weather


final class UtilityTests: XCTestCase {

    func testForURLBuilderWithCity() {
        let finalURL = Utility().urlBuilder(city: "Delhi")
        XCTAssertEqual(finalURL?.absoluteString, "https://api.weatherapi.com/v1/forecast.json?key=afe6c01210214709882110159251301&q=Delhi&days=5")
    }
    
    func testForDateFormatterWithCorrectInputFormat() {
        let convertedDate = Utility().convertDateFormat(dateString: "2024-09-18")
        XCTAssertEqual(convertedDate, "18 Sep")
    }
    
    func testForDateFormatterWithInCorrectInputFormat() {
        let convertedDate = Utility().convertDateFormat(dateString: "2024-18-09")
        XCTAssertEqual(convertedDate, nil)
    }

}
