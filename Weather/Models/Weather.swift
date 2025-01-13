//
//  Weather.swift
//  Weather
//
//  Created by Pawan Kumar Dhawan on 13/01/25.
//

import Foundation

struct Weather : Codable {
    let location : Location?
    let current : Current?
    let forecast : Forecast?
    var timestamp: Date?

    enum CodingKeys: String, CodingKey {

        case location = "location"
        case current = "current"
        case forecast = "forecast"
        case timestamp = "timestamp"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        current = try values.decodeIfPresent(Current.self, forKey: .current)
        forecast = try values.decodeIfPresent(Forecast.self, forKey: .forecast)
        timestamp = try values.decodeIfPresent(Date.self, forKey: .timestamp)
    }
    
    init(location: Location, current: Current, forecast: Forecast, timestamp: Date) {
        self.location = location
        self.current = current
        self.forecast = forecast
        self.timestamp = timestamp
    }

}
