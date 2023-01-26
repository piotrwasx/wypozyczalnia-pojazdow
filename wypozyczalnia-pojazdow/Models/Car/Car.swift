//
//  Car.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 25/01/2023.
//

import Foundation

struct Car: Codable {
    var id: Int
    var car_brand, car_model: String
    var car_year, car_mileage_km: Int
    var car_transmisson, car_motor, car_body_type: String
    var car_rent_price_pln: Int
    
    init() {
        self.id = 0
        self.car_model = ""
        self.car_brand = ""
        self.car_year = 0
        self.car_mileage_km = 0
        self.car_transmisson = ""
        self.car_motor = ""
        self.car_body_type = ""
        self.car_rent_price_pln = 0
    }
}
