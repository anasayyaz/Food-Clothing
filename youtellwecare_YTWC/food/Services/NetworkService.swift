//
//  NetworkService.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 13/01/2020.
//  Copyright © 2020 ucp. All rights reserved.
//

import Foundation
import Moya

private let apiKey = "LiL_HcXbRhANSLWJoKUyDOoZNgKxDBuYPJWthjA2rDb2TmGguB3P3BSGNfoKT-mdghGHeRnwnmEngWjeua1Uw3kudu3lV8U5znFeV8uA2CeEruiuIoA62M2c348bXnYx"

enum YelpService {
    enum BusinessesProvider: TargetType {
        case search(lat: Double, long: Double)
        
        var baseURL: URL {
            return URL(string: "https://api.yelp.com/v3/businesses")!
        }

        var path: String {
            switch self {
            case .search:
                return "/search"
            }
        }

        var method: Moya.Method {
            return .get
        }

        var sampleData: Data {
            return Data()
        }

        var task: Task {
            switch self {
            case let .search(lat, long):
                return .requestParameters(
                    parameters: ["latitude": lat, "longitude": long, "limit": 10], encoding: URLEncoding.queryString)
            }
            
        }

        var headers: [String : String]? {
            return ["Authorization": "Bearer \(apiKey)"]
        }
    }
}
