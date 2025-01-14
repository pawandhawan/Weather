//
//  Weather.swift
//  City
//
//  Created by Pawan Kumar Dhawan on 13/01/25.
//

import Foundation

struct City : Codable {
    
    let name : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
    init(name: String, country: String) {
        self.name = name
    }

}
