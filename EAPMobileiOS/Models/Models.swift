//
//  TMDB_Models.swift
//  MobileExam
//
//  Created by user326 on 23/11/23.
//

import Foundation
// Basado en la API de: https://api.api-ninjas.com/v1/covid19
struct CountryCovidInfo{
    var country: String
    var cases: [Case]
}

struct Case{
    var date: String
    var data: [DayInfo]
}

struct DayInfo{
    var total: Int
    var new: Int
}