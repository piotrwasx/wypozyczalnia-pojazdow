//
//  ListViewModel.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    var dataType: DataTypes
    
    @Published var dataRows: [DataListViewRow] = []
    
    init(dataType: DataTypes) {
        self.dataType = dataType
    }
    
    func loadData() {
        switch dataType {
        case .car:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/cars", dataType: [CarTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        self.dataRows.append(DataListViewRow(id: item.id, title: "\(item.car_brand) \(item.car_model)", dataType: .car))
                    }
                }}
        case .motorcycle:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/motorcycles", dataType: [MotorcycleTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        self.dataRows.append(DataListViewRow(id: item.id, title: "\(item.motorcycle_brand) \(item.motorcycle_model)", dataType: .motorcycle))
                    }
                }}
        case .utility:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/utilities", dataType: [UtilityTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        self.dataRows.append(DataListViewRow(id: item.id, title: "\(item.utility_brand) \(item.utility_model)", dataType: .utility))
                    }
                }}
        case .client:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/clients", dataType: [ClientTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        self.dataRows.append(DataListViewRow(id: item.id, title: "\(item.client_name) \(item.client_surname)", dataType: .client))
                    }
                }}
        }
    }
}
