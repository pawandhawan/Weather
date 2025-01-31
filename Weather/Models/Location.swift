//
//  Location.swift
//  Weather
//
//  Created by Pawan Kumar Dhawan on 13/01/25.
//

import Foundation

struct Location : Codable {
    let name : String?
    let region : String?
    let country : String?
    let lat : Double?
    let lon : Double?
    let tz_id : String?
    let localtime_epoch : Int?
    let localtime : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case region = "region"
        case country = "country"
        case lat = "lat"
        case lon = "lon"
        case tz_id = "tz_id"
        case localtime_epoch = "localtime_epoch"
        case localtime = "localtime"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lon = try values.decodeIfPresent(Double.self, forKey: .lon)
        tz_id = try values.decodeIfPresent(String.self, forKey: .tz_id)
        localtime_epoch = try values.decodeIfPresent(Int.self, forKey: .localtime_epoch)
        localtime = try values.decodeIfPresent(String.self, forKey: .localtime)
    }
    
    init( name : String?, region : String?, country : String?, lat : Double?, lon : Double?, tz_id : String?, localtime_epoch : Int?, localtime : String?) {
        self.name = name
        self.region = region
        self.country = country
        self.lat = lat
        self.lon = lon
        self.tz_id = tz_id
        self.localtime_epoch = localtime_epoch
        self.localtime = localtime
    }
}
