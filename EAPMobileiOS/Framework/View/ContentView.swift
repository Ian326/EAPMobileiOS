//
//  ContentView.swift
//  EAPMobileiOS
//
//  Created by user326 on 23/11/23.
//

import SwiftUI
import Charts

// ContentView que muestra la lista de dias y sus casos de COVID
struct ContentView: View {
    @State var contentViewModel = ContentViewModel()
    var body: some View {
        VStack{
            if contentViewModel.cases.isEmpty{
                Text("Cargando Estadísticas...")
            }
            else{
                ScrollView{
                    Text("Estadisticas Casos COVID-19")
                        .font(.title)
                    Text("Pais: \(contentViewModel.country)")
                        .font(.title2)
                    Text("(Se muestran 10 casos aleatorios en el periodo de la pandemia)")
                        .font(.headline)
                    
                    Divider()
                    
                    Chart(contentViewModel.cases, id:\.self){
                        day in
                        BarMark(x: .value("Fecha", day.date),
                                y: .value("Contagios", day.new))
                    }
                    
                    Divider()
                    
                    VStack{
                        HStack{
                            Text("Rango de fechas: \(contentViewModel.cases[0].date) - \(contentViewModel.cases[contentViewModel.cases.count - 1].date)")
                        }
                        
                        Spacer()
                        
                        HStack{
                            Text("Avg Per Day: \(contentViewModel.avgPerDayReg) | Total (In this days): \(contentViewModel.totalInReg)")
                        }
                    }
                }
            }
        }
        .onAppear(){
            Task{
                await contentViewModel.getCountryCovidInfo()
                }
        }
    }
}
