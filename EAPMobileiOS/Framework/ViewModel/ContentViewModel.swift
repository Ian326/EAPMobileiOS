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

class ContentViewModel: ObservableObject{
    @Published var cases = [String: DayInfo]()
    
    var listRequirement: countryCovidListReqProtocol
    
    init(listRequirement: countryCovidListReqProtocol = ListReq.shared) {
            self.listRequirement = listRequirement
        }
    
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
