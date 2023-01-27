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
            ListView(dataType: "Motorcycle")
                .tabItem {
                    Label("Motocykle", systemImage: "bicycle")
                }
            ListView(dataType: "Car")
                .tabItem {
                    Label("Samochody", systemImage: "car")
                }
            ListView(dataType: "Utility")
                .tabItem {
                    Label("Ciężarowe", systemImage: "box.truck")
                }
            ListView(dataType: "Client")
                .tabItem {
                    Label("Klienci", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
