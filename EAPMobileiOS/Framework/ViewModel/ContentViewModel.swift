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
    @Published var cases = [DayInfo]()
    
    var listRequirement: countryCovidListReqProtocol
    
    init(listRequirement: countryCovidListReqProtocol = ListReq.shared) {
            self.listRequirement = listRequirement
        }
    
    //función que obtiene los datos de la API y los guarda en un diccionario. Se declara como MainActor para que se ejecute en el hilo principal
    @MainActor
    func getCountryCovidInfo() async{
        let Repository = Repository()
        let result = await Repository.getCountryCovidInfo()
        for (index, (date, DayInf)) in result!.cases.prefix(10).enumerated() {
            let tempCase = DayInfo(id: index, date: date, total: DayInf.total, new: DayInf.new)
            self.cases.append(tempCase)
        }
        
        print("Elements:")
        for unitCase in self.cases{
            print(unitCase)
        }
        print("========================================================")
    }
}
