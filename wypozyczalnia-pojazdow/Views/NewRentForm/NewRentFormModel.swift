//
//  NewRentFormModel.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 01/02/2023.
//

import Foundation


import Foundation

/// A view model for ''NewRentForm'' view.
final class NewRentFormModel: ObservableObject {
    
    /// An array of fetched client data in rows of type ''DataListViewRow''
    @Published var clientDataRows: [DataListViewRow] = []
    /// An array of fetched vehicle data in rows of type ''DataListViewRow''
    @Published var vehicleDataRows: [DataListViewRow] = []
    
    /// An array of urls to fetch data of specific type
    var urls = ["clients": "http://127.0.0.1:5000/api/clients/", "motorcycles": "http://127.0.0.1:5000/api/motorcycles/available", "cars": "http://127.0.0.1:5000/api/cars/available", "utilities": "http://127.0.0.1:5000/api/utilities/available"]
    
    /// An array of urls to fetch 
    var rentingUrls = ["motorcycles": "http://127.0.0.1:5000/api/motorcyclesrenting", "cars": "http://127.0.0.1:5000/api/carsrenting", "utilities": "http://127.0.0.1:5000/api/utilitiesrenting"]
    
    /// A function that fetch data of type ''ClientTitle'' from API
    func fetchClientTitles() {
        self.clientDataRows = []
        NetworkController.fetchData(url: urls["clients"]!, dataType: [ClientTitle].self) { response in
            DispatchQueue.main.async {
                for item in response {
                    self.clientDataRows.append(DataListViewRow(id: item.id, title: "\(item.client_name) \(item.client_surname)", dataType: .client))
                }
            }}
    }
    
    /// A function that fetch data of type ''CarTitle'' from API
    /// - Parameter vehicleType: enumerated type of vehicle to fetch its Titles from API
    func fetchVehicleTitles(vehicleType: VehicleType) {
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
    
    /// A function that sends the object using HTTP POST method
    /// - Parameter newRent: object of data type that conforms to ''Codable'',  only ''carRent'', ''motorcycleRent'', ''utilityRent'' are handled
    func sendData<T: Codable>(newRent: T) async {
        if let carRent = newRent as? CarRent {
            Task {
                let _ = await NetworkController.sendData(url: rentingUrls["cars"]!, dataToSend: carRent)
            }
        } else if let motorcycleRent = newRent as? MotorcycleRent {
            Task {
                let _ = await NetworkController.sendData(url: rentingUrls["motorcycles"]!, dataToSend: motorcycleRent)
            }
        } else if let utilityRent = newRent as? UtilityRent {
            Task {
                let _ = await NetworkController.sendData(url: rentingUrls["utilities"]!, dataToSend: utilityRent)
            }
        }
    }
}
