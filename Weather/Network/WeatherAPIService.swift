//
//  WeatherAPIService.swift
//  Weather
//
//  Created by Pawan Kumar Dhawan on 13/01/25.
//

import Foundation
import Alamofire

class WeatherAPIService {
    
    private let sessionManager: Session

    init(session: Session) {
        self.sessionManager = session
    }
    
    func fetchWeather(forCity city: String, completion: @escaping (Weather?, CustomError?) -> Void) {
        let apiURL = Utility().urlBuilder(city: city)
        guard let apiURL = apiURL else{
            completion(nil, CustomError(errorCode: 101, errorMsg: "API URL is invalid"))
            return
        }
        
        sessionManager.request(apiURL).responseData { response in
            let result = self.parseResponse(response: response)
            completion(result.0, result.1)
        }
        
    }
    
    func fetchCityList(forCity city: String, completion: @escaping ([String]?, CustomError?) -> Void) {
        let apiURL = Utility().citySearchUrlBuilder(city: city)
        guard let apiURL = apiURL else{
            completion(nil, CustomError(errorCode: 101, errorMsg: "API URL is invalid"))
            return
        }
        
        sessionManager.request(apiURL).responseData { response in
            let result = self.parseCityListResponse(response: response)
            completion(result.0, result.1)
        }
    }
    
    func parseResponse(response: AFDataResponse<Data>) -> (Weather?, CustomError?) {
        switch response.result {
        case .success(let data):
            do {
                let decoder = JSONDecoder()
                let weatherResponse = try decoder.decode(Weather.self, from: data)
                if weatherResponse.current == nil {
                    return (nil, CustomError(errorCode: 101, errorMsg: "Some Error Occured"))
                }
                return (weatherResponse, nil)
            } catch {
                print("Error while decoding response")
                return (nil, CustomError(errorCode: 101, errorMsg: "Error while decoding response"))
                
            }
        case .failure(let error):
            print(error.localizedDescription)
            return (nil, CustomError(errorCode: 101, errorMsg: error.localizedDescription))
            
        }
    }
    
    func parseCityListResponse(response: AFDataResponse<Data>) -> ([String]?, CustomError?) {
        switch response.result {
        case .success(let data):
            do {
                let decoder = JSONDecoder()
                let cityListResponse = try decoder.decode([City].self, from: data)
                return (cityListResponse.map{ $0.name ?? "" }, nil)
            } catch {
                print("Error while decoding response")
                return (nil, CustomError(errorCode: 101, errorMsg: "Error while decoding response"))
                
            }
        case .failure(let error):
            print(error.localizedDescription)
            return (nil, CustomError(errorCode: 101, errorMsg: error.localizedDescription))
        }
    }
    
    
    
    
}
