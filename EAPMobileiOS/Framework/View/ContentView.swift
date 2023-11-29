//
//  ContentView.swift
//  EAPMobileiOS
//
//  Created by user326 on 23/11/23.
//

import SwiftUI

// ContentView que muestra la lista de dias y sus casos de COVID
struct ContentView: View {
    @State var contentViewModel = ContentViewModel()
    var body: some View {
        VStack{
            if contentViewModel.cases.isEmpty{
                Text("Cargando Estadísticas...")
            }
            else{
                Text("Estadísticas Cargadas! :)")
            }
        }
        .onAppear(){
            Task{
                await contentViewModel.getCountryCovidInfo()
                }
        }
    }
}
