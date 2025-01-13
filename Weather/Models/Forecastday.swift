//
//  ForecastDay.swift
//  Weather
//
//  Created by Pawan Kumar Dhawan on 13/01/25.
//

import Foundation

struct Forecastday : Codable {
    
    let date : String?
    let date_epoch : Int?
    let day : Day?

    enum CodingKeys: String, CodingKey {

        case date = "date"
        case date_epoch = "date_epoch"
        case day = "day"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        date_epoch = try values.decodeIfPresent(Int.self, forKey: .date_epoch)
        day = try values.decodeIfPresent(Day.self, forKey: .day)
    }
}
