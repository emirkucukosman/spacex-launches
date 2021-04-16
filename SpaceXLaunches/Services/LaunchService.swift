//
//  LaunchService.swift
//  SpaceXLaunches
//
//  Created by Emir Küçükosman on 16.04.2021.
//

import Foundation
import Alamofire

final class LaunchService {
    
    static let shared = LaunchService()
    
    private init() {}
    
    func getAllLaunches(completion: @escaping ([Launch]?, String?) -> ()) {
        
        AF.request("https://api.spacexdata.com/v4/launches", method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { (response) in
                
                switch response.result {
                
                case .success(let data):
                    
                    guard let launches = try? JSONDecoder().decode([Launch].self, from: data) else {
                        return completion(nil, "An error occured. Please try again later.")
                    }
                    
                    return completion(launches, nil)
                    
                case .failure(let error):
                    return completion(nil, error.localizedDescription)
                }
                
            }
        
    }
}
