//
//  LaunchViewModel.swift
//  SpaceXLaunches
//
//  Created by Emir Küçükosman on 16.04.2021.
//

import UIKit

struct LaunchViewModel: Codable, Hashable {
    
    private let launch: Launch
    
    init(_ launch: Launch) {
        self.launch = launch
    }
    
    var name: String {
        return launch.name
    }
    
    var success: Bool {
        return launch.success ?? false
    }
    
    var flightNumber: Int {
        return launch.flightNumber
    }
    
    var details: String? {
        return launch.details
    }
    
    var dateLocal: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = formatter.date(from: launch.dateLocal) {
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
        return "Unknown date"
    }
    
    var patchImage: URL {
        return URL(string: launch.links.patch.small ?? "") ?? URL(fileURLWithPath: "")
    }
}
