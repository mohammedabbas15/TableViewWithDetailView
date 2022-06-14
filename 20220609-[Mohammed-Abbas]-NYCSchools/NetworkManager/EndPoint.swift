//
//  NetworkParameters.swift
//  20220609-[Mohammed-Abbas]-NYCSchools
//
//  Created by Field Employee on 6/11/22.
//

//Schools
//https://data.cityofnewyork.us/resource/f9bf-2cp4.json

//Scores
//https://data.cityofnewyork.us/resource/s3k6-pzi2.json

import Foundation

// Here i am creating an endpoint that can return nil if compiler does not find the URL string

enum EndPoint {
    case Data
    var url: URL? {
        switch self {
        case .Data:
            guard let url = URLComponents(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") else { return nil }
            return url.url
        }
    }
}
