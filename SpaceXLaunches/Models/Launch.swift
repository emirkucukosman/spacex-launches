//
//  Launch.swift
//  SpaceXLaunches
//
//  Created by Emir Küçükosman on 16.04.2021.
//

import Foundation

struct Launch: Codable, Hashable {
    let name: String
    let flightNumber: Int
    let success: Bool?
    let details: String?
    let dateLocal: String
    let links: LaunchLinks
    
    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case dateLocal = "date_local"
        
        case name
        case success
        case details
        case links
    }
}

struct LaunchLinks: Codable, Hashable {
    let patch: LaunchPatch
}

struct LaunchPatch: Codable, Hashable {
    let small: String?
    let large: String?
}
