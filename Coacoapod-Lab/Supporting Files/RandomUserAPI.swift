//
//  RandomUserAPI.swift
//  Coacoapod-Lab
//
//  Created by David Lin on 3/3/20.
//  Copyright © 2020 David Lin (Passion Proj). All rights reserved.
//

import Foundation
import Alamofire

struct RandomUserAPIClient {
    static func fetchRandomUser( completion: @escaping (AFResult<[User]>) -> ()) {
        let endpointURL = "https://randomuser.me/api/?results=50"
        
        guard let url = URL(string: endpointURL) else { return }
        
        AF.request(url).response { (response) in
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data {
                do {
                    let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                    completion(.success(results.results))
                } catch {
                    print("\(error)")
                }
            }
            
        }
    }

}
