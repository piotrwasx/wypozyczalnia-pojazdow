//
//  DetailsViewModel.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import Foundation

final class DetailsViewModel: ObservableObject {
    
    @Published var car = [Car]()
    @Published var carRentHistory = [CarRent]()
    
    @Published var motorcycle = [Motorcycle]()
    @Published var motorcycleRentHistory = [MotorcycleRent]()
    
    @Published var utility = [Utility]()
    @Published var utilityRentHistory = [UtilityRent]()
    
    func loadInfo(vehicle_id: Int, vehicle: String) {
        switch vehicle {
        case "Car":
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/cars/\(vehicle_id)", dataType: [Car].self) { response in
                DispatchQueue.main.async {
                    self.car = response
                }}
        case "Motorcycle":
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/motorcycles/\(vehicle_id)", dataType: [Motorcycle].self) { response in
                DispatchQueue.main.async {
                    self.motorcycle = response
                }}
        case "Utility":
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/utilities/\(vehicle_id)", dataType: [Utility].self) { response in
                DispatchQueue.main.async {
                    self.utility = response
                }}
        default: return
        }
    }
    
    func loadRentHistory(vehicle_id: Int, vehicle: String) {
        switch vehicle {
        case "Car":
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/carsrenting/byCar?id=\(vehicle_id)", dataType: [CarRent].self) { response in
                DispatchQueue.main.async {
                    self.carRentHistory = response
                }}
        case "Motorcycle":
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/motorcyclesrenting/byMotorcycle?id=\(vehicle_id)", dataType: [MotorcycleRent].self) { response in
                DispatchQueue.main.async {
                    self.motorcycleRentHistory = response
                }}
        case "Utility":
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/utilitiesrenting/byUtility?id=\(vehicle_id)", dataType: [UtilityRent].self) { response in
                DispatchQueue.main.async {
                    self.utilityRentHistory = response
                }}
        default: return
        }
    }
    
}
