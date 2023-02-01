//
//  NewRentFormModel.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 01/02/2023.
//

import Foundation


import Foundation

final class NewRentFormModel: ObservableObject {
    
    @Published var clientDataRows: [DataListViewRow] = []
    @Published var vehicleDataRows: [DataListViewRow] = []
    
    @Published var confirmationMessage = ""
    @Published var showingConfirmation = false
    
    var urls = ["clients": "http://127.0.0.1:5000/api/clients/", "motorcycles": "http://127.0.0.1:5000/api/motorcycles/available", "cars": "http://127.0.0.1:5000/api/cars/available", "utilities": "http://127.0.0.1:5000/api/utilities/available"]
    
    func fetchClientTitles() {
        self.clientDataRows = []
        NetworkController.fetchData(url: urls["clients"]!, dataType: [ClientTitle].self) { response in
            DispatchQueue.main.async {
                for item in response {
                    self.clientDataRows.append(DataListViewRow(id: item.id, title: "\(item.client_name) \(item.client_surname)", dataType: .client))
                }
            }}
    }
    
    func fetchVehicleTitles(vehicleType: VehicleTypes) {
        switch vehicleType {
        case .car:
            self.vehicleDataRows = []
            NetworkController.fetchData(url: urls["cars"]!, dataType: [CarTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        self.vehicleDataRows.append(DataListViewRow(id: item.id, title: "\(item.car_brand) \(item.car_model)", dataType: .car))
                    }
                }}
        case .motorcycle:
            self.vehicleDataRows = []
            NetworkController.fetchData(url: urls["motorcycles"]!, dataType: [MotorcycleTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        self.vehicleDataRows.append(DataListViewRow(id: item.id, title: "\(item.motorcycle_brand) \(item.motorcycle_model)", dataType: .motorcycle))
                    }
                }}
        case .utility:
            self.vehicleDataRows = []
            NetworkController.fetchData(url: urls["utilities"]!, dataType: [UtilityTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        self.vehicleDataRows.append(DataListViewRow(id: item.id, title: "\(item.utility_brand) \(item.utility_model)", dataType: .utility))
                    }
                }}
        }
    }
    
    func processData(carRent: CarRent) async {
        Task {
            let _ = await NetworkController.sendData(url: "http://127.0.0.1:5000/api/carsrenting", dataToSend: carRent)
        }
    }
    
    func processData(motorcycleRent: MotorcycleRent) async {
        Task {
            let _ = await NetworkController.sendData(url: "http://127.0.0.1:5000/api/motorcyclesrenting", dataToSend: motorcycleRent)
        }
    }
    
    func processData(utilityRent: UtilityRent) async {
        Task {
            let _ = await NetworkController.sendData(url: "http://127.0.0.1:5000/api/utilitiesrenting", dataToSend: utilityRent)
        }
    }
}
