//
//  TMDB_Models.swift
//  MobileExam
//
//  Created by user326 on 23/11/23.
//
import Foundation
// Basado en la API de: https://api.api-ninjas.com/v1/covid19

// Estructura para el modelo de datos de la API
struct CountryCovidInfo: Codable{
    //var country: String
    var region: String
    var country: String
    var cases: [String: DayInfo]
}

// Estructura para el modelo de datos de la API
struct DayInfo: Codable, Identifiable{
    var id: Int?
    var date: String?
    var total: Int
    var new: Int
}

// Estructura para el modelo de datos de a utilizar en el View
struct CaseInfo: Codable, Hashable{
    var date: String
    var total: Int
    var new: Int
}
