//
//  Motorcycle.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import Foundation

struct Motorcycle: Codable {
    var id: Int
    var motorcycle_brand, motorcycle_model: String
    var motorcycle_year, motorcycle_mileage_km: Int
    var motorcycle_motor, motorcycle_body_type: String
    var motorcycle_rent_price_pln: Int
    
    init() {
        self.id = 0
        self.motorcycle_model = ""
        self.motorcycle_brand = ""
        self.motorcycle_year = 0
        self.motorcycle_mileage_km = 0
        self.motorcycle_motor = ""
        self.motorcycle_body_type = ""
        self.motorcycle_rent_price_pln = 0
    }
}
