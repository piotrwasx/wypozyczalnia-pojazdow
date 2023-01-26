//
//  ContentView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ListView(vehicle: "Motorcycle")
                .tabItem {
                    Label("Motocykle", systemImage: "bicycle")
                    
                }
            ListView(vehicle: "Car")
                .tabItem {
                    Label("Samochody", systemImage: "car")
                }
            ListView(vehicle: "Utility")
                .tabItem {
                    Label("Ciężarowe", systemImage: "box.truck")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
