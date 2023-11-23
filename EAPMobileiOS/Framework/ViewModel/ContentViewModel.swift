//
//  ContentViewModel.swift
//  EAPMobileiOS
//
//  Created by user326 on 23/11/23.
//

import Foundation
import Alamofire

class ListReq {
    static let shared = ListRequirement()
}

//clase ContentViewModel que se comunica con la clase ListRequirement para obtener los datos de la API
class ContentViewModel: ObservableObject{
    @Published var cases = [String: DayInfo]()
    
    var listRequirement: countryCovidListReqProtocol
    
    init(listRequirement: countryCovidListReqProtocol = ListReq.shared) {
            self.listRequirement = listRequirement
        }
    
    //función que obtiene los datos de la API y los guarda en un diccionario. Se declara como MainActor para que se ejecute en el hilo principal
    @MainActor
    func getCountryCovidInfo() async{
        let Repository = Repository()
        let result = await Repository.getCountryCovidInfo()
        var i = 1
        for (date, DayInf) in result!.cases {
            let tempCase = DayInfo(total: DayInf.total, new: DayInf.new)
            
            self.cases[date] = tempCase
            
            i+=1
        }
    }
}
