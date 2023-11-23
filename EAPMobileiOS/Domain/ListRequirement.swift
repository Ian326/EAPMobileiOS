//
//  ListRequirement.swift
//  EAPMobileiOS
//
//  Created by user326 on 23/11/23.
//

import Foundation

protocol countryCovidListReqProtocol{
    func getCountryCovidInfo() async -> CountryCovidInfo?
}

//clase ListRequirement que implementa el protocolo countryCovidListReqProtocol. 
//Se comunica con la clase Repository para obtener los datos de la API
class ListRequirement: countryCovidListReqProtocol {
    let dataRepository: Repository

    init(dataRepository: Repository = Repository.shared) {
        self.dataRepository = dataRepository
    }

    func getCountryCovidInfo() async -> CountryCovidInfo? {
            return await dataRepository.getCountryCovidInfo()
    }
}
