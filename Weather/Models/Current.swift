//
//  Current.swift
//  Weather
//
//  Created by Pawan Kumar Dhawan on 13/01/25.
//

import Foundation

struct Current : Codable {
    let temp_c : Double?
    let condition : Condition?
    let wind_mph : Double?
    let wind_kph : Double?
    let humidity : Int?
    let cloud : Int?
    let feelslike_c : Double?

    enum CodingKeys: String, CodingKey {

        case temp_c = "temp_c"
        case condition = "condition"
        case wind_mph = "wind_mph"
        case wind_kph = "wind_kph"
        case humidity = "humidity"
        case cloud = "cloud"
        case feelslike_c = "feelslike_c"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temp_c = try values.decodeIfPresent(Double.self, forKey: .temp_c)
        condition = try values.decodeIfPresent(Condition.self, forKey: .condition)
        wind_mph = try values.decodeIfPresent(Double.self, forKey: .wind_mph)
        wind_kph = try values.decodeIfPresent(Double.self, forKey: .wind_kph)
        humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
        cloud = try values.decodeIfPresent(Int.self, forKey: .cloud)
        feelslike_c = try values.decodeIfPresent(Double.self, forKey: .feelslike_c)
    }
    
    init(temp_c : Double?, condition : Condition?, wind_mph : Double?, wind_kph : Double?, humidity : Int?, cloud : Int?, feelslike_c : Double?) {
        self.temp_c = temp_c
        self.condition = condition
        self.wind_mph = wind_mph
        self.wind_kph = wind_kph
        self.humidity = humidity
        self.cloud = cloud
        self.feelslike_c = feelslike_c
    }
        
}
