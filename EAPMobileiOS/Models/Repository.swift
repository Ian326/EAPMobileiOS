//
//  Repository.swift
//  EAPMobileiOS
//
//  Created by user326 on 23/11/23.
//

import Foundation
import SwiftUI

struct API{
    static let route = "https://api.api-ninjas.com/v1/covid19?country=mexico"
}

class Repository: APIProtocol {
    
    let nservice: NetworkAPIService
        init(nservice: NetworkAPIService = NetworkAPIService.shared){
            self.nservice = nservice
        }
    
    func getCountryCovidInfo() async -> CountryCovidInfo?{
        return await nservice.getCountryCovidInfo(url: URL(string:API.route)!)
    }
}