//
//  ContentView.swift
//  EAPMobileiOS
//
//  Created by user326 on 23/11/23.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImageSwiftUI

// ContentView que muestra la lista de dias y sus casos de COVID
struct ContentView: View {
    @State var contentViewModel = ContentViewModel()
    var body: some View {
        Text("HelloWorld")
        .onAppear(){
        Task{
            await contentViewModel.getCountryCovidInfo()
            }
        }
    }
}
