//
//  WeatherAPIServiceTests.swift
//  Weather
//
//  Created by Pawan Kumar Dhawan on 13/01/25.
//

import XCTest
import Alamofire
@testable import Weather

final class WeatherAPIServiceTests: XCTestCase {
    
    func testForResponseParsingSuccessCase() {
        let response = DataResponse(request: URLRequest(url: MockResponse().sampleURL!), response: HTTPURLResponse(), data: Data(), metrics: URLSessionTaskMetrics(), serializationDuration: 1, result: MockResponse().getSuccessResponseResult())

        let apiService = WeatherAPIService(session: MockSession())
        
        let finalResult = apiService.parseResponse(response: response)
        XCTAssertNil(finalResult.1)
        XCTAssertNotNil(finalResult.0)
        
    }
    
    func testForResponseParsingErrorCaseWithBlankData() {
        let response = DataResponse(request: URLRequest(url: MockResponse().sampleURL!), response: HTTPURLResponse(), data: Data(), metrics: URLSessionTaskMetrics(), serializationDuration: 1, result: MockResponse().getErrorResponseResult())

        let apiService = WeatherAPIService(session: MockSession())
        
        let finalResult = apiService.parseResponse(response: response)
        XCTAssertNil(finalResult.0)
        XCTAssertNotNil(finalResult.1)
        
    }

}
