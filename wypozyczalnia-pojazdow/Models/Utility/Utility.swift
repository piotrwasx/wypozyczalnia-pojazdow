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
}
