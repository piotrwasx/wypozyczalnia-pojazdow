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
            ListView(dataType: .motorcycle)
                .tabItem {
                    Label("Motocykle", systemImage: "bicycle")
                }
            ListView(dataType: .car)
                .tabItem {
                    Label("Samochody", systemImage: "car")
                }
            ListView(dataType: .utility)
                .tabItem {
                    Label("Ciężarowe", systemImage: "box.truck")
                }
            ListView(dataType: .client)
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
