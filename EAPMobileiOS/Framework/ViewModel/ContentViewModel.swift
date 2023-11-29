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
    @Published var country = ""
    @Published var cases = [CaseInfo]()
    @Published var maxInADay = 0
    @Published var totalInReg = 0
    @Published var avgPerDayReg = 0.0
    
    var listRequirement: countryCovidListReqProtocol
    
    init(listRequirement: countryCovidListReqProtocol = ListReq.shared) {
            self.listRequirement = listRequirement
        }
    
    //función que obtiene los datos de la API y los guarda en un diccionario. Se declara como MainActor para que se ejecute en el hilo principal
    @MainActor
    func getCountryCovidInfo() async{
        let result = await listRequirement.getCountryCovidInfo()
        country = result!.country
        for (_, (date, DayInf)) in result!.cases.prefix(10).enumerated() {
            let tempCase = CaseInfo(date: date, total: DayInf.total, new: DayInf.new)
            cases.append(tempCase)
            
            totalInReg += DayInf.new
            
            if (DayInf.new > maxInADay){
                maxInADay = DayInf.new
            }
        }
        avgPerDayReg = Double(totalInReg) / Double(cases.count)
        
        cases = cases.sorted(by: {$0.date < $1.date})
        
        print(country)
        print("Elements:")
        for unitCase in cases{
            print(unitCase)
        }
        print("Avg Registered: \(avgPerDayReg) | Total Registered: \(totalInReg)")
        print("========================================================")
        
    }
}
