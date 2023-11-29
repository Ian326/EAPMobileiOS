//
//  Repository.swift
//  EAPMobileiOS
//
//  Created by user326 on 23/11/23.
//

import Foundation
import SwiftUI

//definimos la ruta de la API
struct API{
    static let route = "https://api.api-ninjas.com/v1/covid19?country=mexico"
}

//definimos el protocolo de la API. Este protocolo se implementa en la clase Repository
protocol APIProtocol{
    func getCountryCovidInfo() async -> CountryCovidInfo?
}

//clase Repository que implementa el protocolo APIProtocol. Se comunica con la clase NetworkAPIService para obtener los datos de la API
class Repository: APIProtocol {
    static let shared = Repository()
    let nservice: NetworkAPIService
        init(nservice: NetworkAPIService = NetworkAPIService.shared){
            self.nservice = nservice
        }
    
    func getCountryCovidInfo() async -> CountryCovidInfo?{
        let apiReq: [CountryCovidInfo]?  = await nservice.getCountryCovidInfo(url: URL(string:API.route)!)
        return apiReq!.first
    }
}
