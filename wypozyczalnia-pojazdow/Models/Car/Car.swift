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
    }
    
    func isCarDataValid(car: Car) -> Bool {
        if car.car_brand.isEmpty || car.car_model.isEmpty || car.car_body_type.isEmpty || car.car_motor.isEmpty || car.car_transmission.isEmpty {
            return false
        }
        if car.car_brand.isNumber || car.car_model.isNumber || car.car_body_type.isNumber || car.car_motor.isNumber || car.car_transmission.isNumber  {
            return false
        }
        return true
    }
}
