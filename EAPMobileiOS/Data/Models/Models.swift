//
//  TMDB_Models.swift
//  MobileExam
//
//  Created by user326 on 23/11/23.
//
import Foundation
// Basado en la API de: https://api.api-ninjas.com/v1/covid19
struct CountryCovidInfo: Codable{
    var country: String
    var cases: [String: DayInfo]
}

struct DayInfo: Codable{
    var total: Int
    var new: Int
}