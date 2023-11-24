//
//  requestView.swift
//  EAPMobileiOS
//
//  Created by user326 on 24/11/23.
//

import Alamofire
import Foundation
import SwiftUI
import SDWebImageSwiftUI
import SDWebImageSwiftUI

// ContentView que muestra la lista de dias y sus casos de COVID
struct RequestView: View {
    @State var cases = [String: DayInfo]()
    let API2 = "https://image.tmdb.org/t/p/w500"
    var body: some View {
            
            Text("Hola")
            .onAppear(){
            Task{
                print("Hola")
                print("==============")
                await API()
            }
        }
    }

    //función que obtiene los datos de la API. Regresa un objeto CountryCovidInfo.
    //Se comunica con la clase Repository para obtener los datos de la API
    func API() async{
        let url = "https://api.api-ninjas.com/v1/covid19?country=mexico"
        let apiKey = "g3Tv8Lbi9vKRwauBtBMj+w==yrCGQ439r92J5ign"
        var headrs: HTTPHeaders = ["X-Api-Key": apiKey]
        
        // Perform the GET request
        AF.request(url, method: .get, headers: headrs).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let jsonArray = value as? [[String: Any]] {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: jsonArray[0])
                        // Print the JSON data as a string for debugging
                        let countryCovidInfo = try JSONDecoder().decode(CountryCovidInfo.self, from: jsonData)
                    }
                    
                    catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
                else {
                    print("Error: Unexpected format in response")
                }
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
        // Perform the GET request
        AF.request(url, method: .get, headers: headrs).responseDecodable(of: [CountryCovidInfo].self) { response in
            switch response.result {
            case .success(let countryCovidInfoArray):
                print(countryCovidInfoArray[0].country)
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }


        
         
    }
}

// ContentView_Previews. Muestra la vista previa de ContentView
struct RequestViews_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //var cases: [String : DayInfo] = ["2020-01-04": DayInfo(total: 0, new: 1),
                                         //"2020-01-05": DayInfo(total: 6, new: 5),
                                         //"2020-01-06": DayInfo(total: 15, new: 9)]
        //ContentView(cases:cases)
    }
}
