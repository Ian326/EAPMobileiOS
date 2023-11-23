//
//  ContentView.swift
//  EAPMobileiOS
//
//  Created by user326 on 23/11/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @State var cases = [Case]()
    let API2 = "https://image.tmdb.org/t/p/w500"
    var body: some View {
        List(cases){
            case1 in VStack{
                HStack{
                    Text(case1.date)
                        .font(.title)
                }
                HStack{
                    Text("Total: \(case1.data[0].total)")
                        .font(.headline)
                    Text("New: \(case1.data[0].new)")
                        .font(.headline)
                }
                Divider()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let case1 = Case(date: "2020-01-23", data: [DayInfo(total: 100, new: 10)])
        let case2 = Case(date: "2020-01-24", data: [DayInfo(total: 200, new: 20)])
        let case3 = Case(date: "2020-01-25", data: [DayInfo(total: 300, new: 30)])
        
        let cases : [Case] = [case1, case2, case3]
        
        ContentView(cases: cases)
    }
}