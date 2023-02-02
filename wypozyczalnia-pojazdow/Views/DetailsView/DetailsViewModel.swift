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
    
    @Published var confirmationMessage = ""
    @Published var showingConfirmation = false
    
    var urls = ["clients": "http://127.0.0.1:5000/api/clients/", "motorcycles": "http://127.0.0.1:5000/api/motorcycles/", "cars": "http://127.0.0.1:5000/api/cars/", "utilities": "http://127.0.0.1:5000/api/utilities/"]
    
    func loadData(id: Int, dataType: DataTypes) {
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
        case .rent:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/rented/\(id)", dataType: [Car].self) { response in
                DispatchQueue.main.async {
                    self.car = response
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
        case .rent:
            return
        }
    }
    
    func update(car: Car) -> Bool {
        if car.isCarDataValid() {
            Task {
                await NetworkController.alterData(url: urls["cars"]!, dataToSend: car)
            }
            return true
        }
        return false
    }
    
    func update(motorcycle: Motorcycle) -> Bool {
        if motorcycle.isMotorcycleDataValid() {
            Task {
                await NetworkController.alterData(url: urls["motorcycles"]!, dataToSend: motorcycle)
            }
            return true
        }
        return false
    }
    
    func update(utility: Utility) -> Bool {
        if utility.isUtilityDataValid() {
            Task {
                 await NetworkController.alterData(url: urls["utilities"]!, dataToSend: utility)
            }
            return true
        }
        return false
    }
    
    func update(client: Client) -> Bool {
        if client.isClientDataValid() {
            Task {
                await NetworkController.alterData(url: urls["clients"]!, dataToSend: client) 
            }
            return true
        }
        return false
    }
    
}
