//
//  RentedListViewModel.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 01/02/2023.
//

import Foundation

final class RentedListViewModel: ObservableObject {
    
    @Published var rentedCarRows: [DataListViewRow] = []
    @Published var rentedUtilityRows: [DataListViewRow] = []
    @Published var rentedMotorcycleRows: [DataListViewRow] = []
    
    func loadData() {
        self.rentedCarRows = []
        self.rentedUtilityRows = []
        self.rentedMotorcycleRows = []
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
