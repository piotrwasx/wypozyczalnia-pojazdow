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
    var motorcycle_availability: Bool
    
    init() {
        self.id = 0
        self.motorcycle_model = ""
        self.motorcycle_brand = ""
        self.motorcycle_year = 0
        self.motorcycle_mileage_km = 0
        self.motorcycle_motor = ""
        self.motorcycle_body_type = ""
        self.motorcycle_rent_price_pln = 0
        self.motorcycle_availability = true
    }
    
    init(motorcycle_model: String, motorcycle_brand: String, motorcycle_year: Int, motorcycle_mileage_km: Int, motorcycle_motor: String, motorcycle_body_type: String, motorcycle_rent_price_pln: Int) {
        self.id = 0
        self.motorcycle_model = motorcycle_model
        self.motorcycle_brand = motorcycle_brand
        self.motorcycle_year = motorcycle_year
        self.motorcycle_mileage_km = motorcycle_mileage_km
        self.motorcycle_motor = motorcycle_motor
        self.motorcycle_body_type = motorcycle_body_type
        self.motorcycle_rent_price_pln = motorcycle_rent_price_pln
        self.motorcycle_availability = true
    }
    
    /// Checks if provided motorcycle data is valid
    /// - Returns: returns boolean
    func isMotorcycleDataValid() -> Bool {
        if self.motorcycle_brand.isEmpty || self.motorcycle_model.isEmpty || self.motorcycle_body_type.isEmpty || self.motorcycle_motor.isEmpty {
            return false
        }
        if self.motorcycle_brand.isNumber || self.motorcycle_model.isNumber || self.motorcycle_body_type.isNumber || self.motorcycle_motor.isNumber {
            return false
        }
        if self.motorcycle_year < 1900 || self.motorcycle_mileage_km < 0 || self.motorcycle_rent_price_pln < 0 {
            return false
        }
        return true
    }
}
