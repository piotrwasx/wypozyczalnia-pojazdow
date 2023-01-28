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
    @Published var clientTitles: [ClientTitle] = []
    
    var dataType: DataTypes
    
    init(dataType: DataTypes) {
        self.dataType = dataType
    }
    
    func loadData() {
        switch dataType {
        case .car:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/cars", dataType: [CarTitle].self) { response in
                DispatchQueue.main.async {
                    self.carTitles = response
                }}
        case .motorcycle:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/motorcycles", dataType: [MotorcycleTitle].self) { response in
                DispatchQueue.main.async {
                    self.motorcycleTitles = response
                }}
        case .utility:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/utilities", dataType: [UtilityTitle].self) { response in
                DispatchQueue.main.async {
                    self.utilityTitles = response
                }}
        case .client:
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/clients", dataType: [ClientTitle].self) { response in
                DispatchQueue.main.async {
                    self.clientTitles = response
                }}
        }
    }
}
