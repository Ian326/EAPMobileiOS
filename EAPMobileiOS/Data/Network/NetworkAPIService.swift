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
    
    func getCountryCovidInfo(url: URL) async -> [CountryCovidInfo]?{
        let headers: HTTPHeaders = [
                    "X-Api-Key": "g3Tv8Lbi9vKRwauBtBMj+w==yrCGQ439r92J5ign"
                ]
        let taskRequest = AF.request(url, method: .get, headers: headers)
        let response = await taskRequest.serializingData().response
        
        switch response.result {
            case .success(let data):
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data) as? [[String: Any]]
                    print("Successfully connected to API and converted to CountryCovidInfo")
                    print("========================================================")
                    return try JSONDecoder().decode([CountryCovidInfo].self, from: data)
                }
                catch let error{
                    print("Couldn't convert information of API to CountryCovidInfo")
                    print("========================================================")
                    print(error)
                    return nil
                }
            case let .failure(error):
                debugPrint(error.localizedDescription)
                return nil
            }
    }
}


