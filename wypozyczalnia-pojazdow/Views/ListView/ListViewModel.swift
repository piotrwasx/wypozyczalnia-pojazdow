//
//  ListViewModel.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    @Published var carTitles: [CarTitle] = []
    @Published var motorcycleTitles: [MotorcycleTitle] = []
    @Published var utilityTitles: [UtilityTitle] = []
    
    var vehicle: String
    
    init(vehicle: String) {
        self.vehicle = vehicle
    }
    
    func loadData() {
        switch vehicle {
        case "Car":
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/cars", dataType: [CarTitle].self) { response in
                DispatchQueue.main.async {
                    self.carTitles = response
                }}
        case "Motorcycle":
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/motorcycles", dataType: [MotorcycleTitle].self) { response in
                DispatchQueue.main.async {
                    self.motorcycleTitles = response
                }}
        case "Utility":
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/utilities", dataType: [UtilityTitle].self) { response in
                DispatchQueue.main.async {
                    self.utilityTitles = response
                }}

        default:
            print("Have you done something new?")
        }
    }
}
