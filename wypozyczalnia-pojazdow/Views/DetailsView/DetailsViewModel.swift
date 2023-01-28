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
    
    @Published var client = [Client]()
    @Published var clientRentHistory = [ClientRent]()
    
    func loadInfo(id: Int, dataType: DataTypes) {
        switch dataType {
        case .car:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/cars/\(id)", dataType: [Car].self) { response in
                DispatchQueue.main.async {
                    self.car = response
                }}
        case .motorcycle:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/motorcycles/\(id)", dataType: [Motorcycle].self) { response in
                DispatchQueue.main.async {
                    self.motorcycle = response
                }}
        case .utility:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/utilities/\(id)", dataType: [Utility].self) { response in
                DispatchQueue.main.async {
                    self.utility = response
                }}
        case .client:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/clients/\(id)", dataType: [Client].self) { response in
                DispatchQueue.main.async {
                    self.client = response
                }}
        }
    }
    
    func loadRentHistory(id: Int, dataType: DataTypes) {
        switch dataType {
        case .car:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/carsrenting/byCar?id=\(id)", dataType: [CarRent].self) { response in
                DispatchQueue.main.async {
                    self.carRentHistory = response
                }}
        case .motorcycle:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/motorcyclesrenting/byMotorcycle?id=\(id)", dataType: [MotorcycleRent].self) { response in
                DispatchQueue.main.async {
                    self.motorcycleRentHistory = response
                }}
        case .utility:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/utilitiesrenting/byUtility?id=\(id)", dataType: [UtilityRent].self) { response in
                DispatchQueue.main.async {
                    self.utilityRentHistory = response
                }}
        case .client:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/clientsrenting/byClient?client_id=\(id)", dataType: [ClientRent].self) { response in
                DispatchQueue.main.async {
                    self.clientRentHistory = response
                }}
        }
    }
}
