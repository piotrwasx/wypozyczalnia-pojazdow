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
    }
    
    func isUtilityDataValid(utility: Utility) -> Bool {
        if utility.utility_brand.isEmpty || utility.utility_model.isEmpty || utility.utility_type.isEmpty || utility.utility_motor.isEmpty || utility.utility_transmission.isEmpty {
            return false
        }
        if utility.utility_brand.isNumber || utility.utility_model.isNumber || utility.utility_type.isNumber || utility.utility_motor.isNumber || utility.utility_transmission.isNumber  {
            return false
        }
        return true
    }
}
