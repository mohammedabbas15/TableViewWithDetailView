//
//  Model.swift
//  20220609-[Mohammed-Abbas]-NYCSchools
//
//  Created by Field Employee on 6/10/22.
//

import Foundation

// made this model with help from the website https://quicktype.io
struct WelcomeElement: Decodable {
    let dbn, schoolName, numOfSatTestTakers, satCriticalReadingAvgScore: String?
    let satMathAvgScore, satWritingAvgScore: String?

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
}

typealias Welcome = [WelcomeElement]
