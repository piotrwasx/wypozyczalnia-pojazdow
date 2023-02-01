//
//  ListViewModel.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import Foundation

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}

final class ListViewModel: ObservableObject {
    
    var dataType: DataTypes
    
    @Published var dataRows: [DataListViewRow] = []
    
    @Published var rentedCarRows: [DataListViewRow] = []
    @Published var rentedUtilityRows: [DataListViewRow] = []
    @Published var rentedMotorcycleRows: [DataListViewRow] = []
    
    init(dataType: DataTypes) {
        self.dataType = dataType
    }
    
    func loadData() {
        switch dataType {
        case .car:
            self.dataRows = []
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/cars", dataType: [CarTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        self.dataRows.append(DataListViewRow(id: item.id, title: "\(item.car_brand) \(item.car_model)", dataType: .car))
                    }
                }}
        case .motorcycle:
            self.dataRows = []
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/motorcycles", dataType: [MotorcycleTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        self.dataRows.append(DataListViewRow(id: item.id, title: "\(item.motorcycle_brand) \(item.motorcycle_model)", dataType: .motorcycle))
                    }
                }}
        case .utility:
            self.dataRows = []
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/utilities", dataType: [UtilityTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        self.dataRows.append(DataListViewRow(id: item.id, title: "\(item.utility_brand) \(item.utility_model)", dataType: .utility))
                    }
                }}
        case .client:
            self.dataRows = []
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/clients", dataType: [ClientTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        self.dataRows.append(DataListViewRow(id: item.id, title: "\(item.client_name) \(item.client_surname)", dataType: .client))
                    }
                }}
        case .rent:
            self.dataRows = []
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/rented/cars", dataType: [CarTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        self.rentedCarRows.append(DataListViewRow(id: item.id, title: "\(item.car_model) \(item.car_brand)", dataType: .car))
                    }
                }}
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/rented/motorcycles", dataType: [MotorcycleTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        self.rentedMotorcycleRows.append(DataListViewRow(id: item.id, title: "\(item.motorcycle_model) \(item.motorcycle_brand)", dataType: .motorcycle))
                    }
                    
                }}
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/rented/utilities", dataType: [UtilityTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        self.rentedUtilityRows.append(DataListViewRow(id: item.id, title: "\(item.utility_model) \(item.utility_brand)", dataType: .utility))
                    }
                }}
        }
    }
    
    func deleteData(id: Int, dataType: DataTypes) async -> String {
        switch dataType {
        case .client:
            return await NetworkController.changeAvailability(url: "http://127.0.0.1:5000/api/clients/\(id)")
        case .utility:
            return await NetworkController.changeAvailability(url: "http://127.0.0.1:5000/api/utilities/\(id)")
        case .motorcycle:
            return await NetworkController.changeAvailability(url: "http://127.0.0.1:5000/api/motorcycles/\(id)")
        case .car:
            return await NetworkController.changeAvailability(url: "http://127.0.0.1:5000/api/cars/\(id)")
        default:
            return "Zły typ danych"
        }
        
    }
}
