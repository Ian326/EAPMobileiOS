//
//  ContentView.swift
//  EAPMobileiOS
//
//  Created by user326 on 23/11/23.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @State var cases = [String: DayInfo]()
    let API2 = "https://image.tmdb.org/t/p/w500"
    var body: some View {
            List(cases.sorted(by: { $0.key < $1.key }), id: \.key) { (date, DayInfo) in
                VStack {
                    HStack {
                        Text(date)
                            .font(.title)
                    }
                    HStack {
                        Text("Total: \(DayInfo.total)")
                            .font(.headline)
                        Text("New: \(DayInfo.new)")
                            .font(.headline)
                    }
                    Divider()
                }
            }.onAppear(){
            Task{
                await getCountryCovidInfo()
            }
        }
    }

    func getCountryCovidInfo() async{
        let Repository = Repository()
        let result = await Repository.getCountryCovidInfo()
        var tempCasesList = [String: DayInfo]()
        var i = 1
        for (date, DayInf) in result!.cases {
            let tempCase = DayInfo(total: DayInf.total, new: DayInf.new)
            
            tempCasesList[date] = tempCase
            
            i+=1
        }
        cases = tempCasesList
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
