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
    var car_transmission, car_motor, car_body_type: String
    var car_rent_price_pln: Int
    var car_availability: Bool
    
    init() {
        self.id = 0
        self.car_model = ""
        self.car_brand = ""
        self.car_year = 0
        self.car_mileage_km = 0
        self.car_transmission = ""
        self.car_motor = ""
        self.car_body_type = ""
        self.car_rent_price_pln = 0
        self.car_availability = true
    }
    
    init(car_brand: String, car_model: String, car_year: Int, car_mileage_km: Int, car_transmission: String, car_motor: String, car_body_type: String, car_rent_price_pln: Int) {
        self.id = 0
        self.car_model = car_model
        self.car_brand = car_brand
        self.car_year = car_year
        self.car_mileage_km = car_mileage_km
        self.car_transmission = car_transmission
        self.car_motor = car_motor
        self.car_body_type = car_body_type
        self.car_rent_price_pln = car_rent_price_pln
        self.car_availability = true
    }
    
    /// Checks if provided car data is valid
    /// - Returns: returns boolean
    func isCarDataValid() -> Bool {
        if self.car_brand.isEmpty || self.car_model.isEmpty || self.car_body_type.isEmpty || self.car_motor.isEmpty || self.car_transmission.isEmpty {
            return false
        }
        if self.car_brand.isNumber || self.car_model.isNumber || self.car_body_type.isNumber || self.car_motor.isNumber || self.car_transmission.isNumber  {
            return false
        }
        if self.car_year < 1900 || self.car_mileage_km < 0 || self.car_rent_price_pln < 0 {
            return false
        }
        return true
    }
}
