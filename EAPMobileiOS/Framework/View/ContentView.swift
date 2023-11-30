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
    @StateObject var contentViewModel = ContentViewModel()
    var body: some View {
        VStack{
            if contentViewModel.cases.isEmpty{
                Text("Cargando Estadísticas...")
            }
            else{
                VStack{
                    Group{
                        Text("").padding(1)
                        Text("Estadisticas Casos COVID-19")
                            .font(.title).padding(.top, 1)
                        
                        Text("Pais: \(contentViewModel.country)")
                            .font(.title2).padding(.bottom, 1)
                        
                        Text("(Se muestran 10 casos aleatorios en el periodo de la pandemia)")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                    }
                    Divider()
                }
                ScrollView{
                    VStack{
                                                
                        Group{
                            Spacer()
                            HStack{
                                Chart(contentViewModel.cases, id:\.self){
                                    day in
                                    BarMark(x: .value("Fecha", day.date),
                                            y: .value("Contagios", day.new))
                                }
                            }
                            Spacer()
                        }
                        
                        Divider()
                        
                        Group{
                            HStack{
                                Text("Rango de fechas: ")
                                    .font(.caption).bold()
                                Text("\(contentViewModel.cases[0].date) - \(contentViewModel.cases[contentViewModel.cases.count - 1].date)").font(.caption)
                            }
                            
                            Spacer()
                            
                            HStack{
                                Text("Promedio al dia: ").font(.caption).bold()
                                Text("\(Int(contentViewModel.avgPerDayReg)) casos").font(.caption)
                            }
                            
                            Spacer()
                            
                            HStack{
                                Text("Total (Estos 10 dias): ").font(.caption).bold()
                                Text("\(contentViewModel.totalInReg) casos").font(.caption)
                            }
                            
                            Divider()
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
