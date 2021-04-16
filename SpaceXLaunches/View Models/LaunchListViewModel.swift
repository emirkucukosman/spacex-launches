//
//  LaunchListViewModel.swift
//  SpaceXLaunches
//
//  Created by Emir Küçükosman on 16.04.2021.
//

import Foundation

class LaunchListViewModel: ObservableObject {
    
    @Published var launches: [LaunchViewModel]?
    @Published var error: String?
    
    init() {
        LaunchService.shared.getAllLaunches { (launches, error) in
            if let error = error {
                return self.error = error
            }
            
            if let launches = launches {
                self.launches = launches.map({ LaunchViewModel($0) })
            }
        }
    }
}
