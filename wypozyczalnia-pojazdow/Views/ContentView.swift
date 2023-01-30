//
//  ContentView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var motorcycleViewModel = ListViewModel(dataType: .motorcycle)
    @ObservedObject var carViewModel = ListViewModel(dataType: .car)
    @ObservedObject var utilityViewModel = ListViewModel(dataType: .utility)
    @ObservedObject var clientViewModel = ListViewModel(dataType: .client)
    
    var body: some View {
        TabView {
            ListView(rows: $motorcycleViewModel.dataRows)
                .tabItem {
                    Label("Motocykle", systemImage: "bicycle")
                }
            ListView(rows: $carViewModel.dataRows)
                .tabItem {
                    Label("Samochody", systemImage: "car")
                }
            ListView(rows: $utilityViewModel.dataRows)
                .tabItem {
                    Label("Ciężarowe", systemImage: "box.truck")
                }
            ListView(rows: $clientViewModel.dataRows)
                .tabItem {
                    Label("Klienci", systemImage: "person")
                }
        }
        .onAppear() {
            motorcycleViewModel.loadData()
            carViewModel.loadData()
            utilityViewModel.loadData()
            clientViewModel.loadData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
