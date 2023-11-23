//
//  NetworkAPIService.swift
//  EAPMobileiOS
//
//  Created by user326 on 23/11/23.
//

import Foundation
import Alamofire

//clase NetworkAPIService que se comunica con la API
class NetworkAPIService {
    static let shared = NetworkAPIService()
    private let apiKey = "g3Tv8Lbi9vKRwauBtBMj+w==yrCGQ439r92J5ign"
    
    //función que obtiene los datos de la API. Regresa un objeto CountryCovidInfo.
    func getCountryCovidInfo(url: URL) async -> CountryCovidInfo?{
        var headers: HTTPHeaders = [:]
        headers["X-Api-Key"] = "\(apiKey)"
        let taskRequest = AF.request(url, method: .get, headers: headers).validate()
        let response = await taskRequest.serializingData().response

        switch response.result {
            //si la respuesta es exitosa, se decodifica el JSON y se regresa un objeto CountryCovidInfo
            case .success(let data):
                do{
                    try print(JSONDecoder().decode(CountryCovidInfo.self, from: data))
                    return try JSONDecoder().decode(CountryCovidInfo.self, from: data)
                }
                catch{
                    return nil
                }
            //si la respuesta es fallida, se imprime el error y se regresa nil
            case let .failure(error):
                debugPrint(error.localizedDescription)
                return nil
        }
    }
}


