//
//  APIProtocol.swift
//  EAPMobileiOS
//
//  Created by user326 on 23/11/23.
//

protocol APIProtocol{
    func getCountryCovidInfo() async -> CountryCovidInfo?
}
