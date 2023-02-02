//
//  Utility.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import Foundation

struct Utility: Codable {
    var id: Int
    var utility_brand, utility_model: String
    var utility_year, utility_mileage_km: Int
    var utility_transmission, utility_motor, utility_type: String
    var utility_rent_price_pln: Int
    var utility_availability: Bool
    
    init() {
        self.id = 0
        self.utility_brand = ""
        self.utility_model = ""
        self.utility_year = 0
        self.utility_mileage_km = 0
        self.utility_transmission = ""
        self.utility_motor = ""
        self.utility_type = ""
        self.utility_rent_price_pln = 0
        self.utility_availability = true
    }
    
    init(utility_brand: String, utility_model: String, utility_year: Int, utility_mileage_km: Int, utility_transmission: String, utility_motor: String, utility_type: String, utility_rent_price_pln: Int) {
        self.id = 0
        self.utility_brand = utility_brand
        self.utility_model = utility_model
        self.utility_year = utility_year
        self.utility_mileage_km = utility_mileage_km
        self.utility_transmission = utility_transmission
        self.utility_motor = utility_motor
        self.utility_type = utility_type
        self.utility_rent_price_pln = utility_rent_price_pln
        self.utility_availability = true
    }
    
    func isUtilityDataValid() -> Bool {
        if self.utility_brand.isEmpty || self.utility_model.isEmpty || self.utility_type.isEmpty || self.utility_motor.isEmpty || self.utility_transmission.isEmpty {
            return false
        }
        if self.utility_brand.isNumber || self.utility_model.isNumber || self.utility_type.isNumber || self.utility_motor.isNumber || self.utility_transmission.isNumber  {
            return false
        }
        if self.utility_year < 1900 || self.utility_mileage_km < 0 || self.utility_rent_price_pln < 0 {
            return false
        }
        return true
    }
}
