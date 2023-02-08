//
//  DataTypes.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 28/01/2023.
//

import Foundation

enum DataType {
    case car, motorcycle, utility, client, rent
}

enum VehicleType: String, Equatable, CaseIterable {
    case car = "Samochód"
    case motorcycle = "Motocykl"
    case utility = "Ciężarówka"
}
