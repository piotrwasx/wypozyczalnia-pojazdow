//
//  MotorcycleRent.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import Foundation

struct MotorcycleRent: Codable {
    var id, client_id, motorcycle_id: Int
    var rent_start, rent_end: String
    var rent_insurance: Bool
    
    init() {
        self.id = 0
        self.client_id = 0
        self.motorcycle_id = 0
        self.rent_start = ""
        self.rent_end = ""
        self.rent_insurance = false
    }
    
    init(client_id: Int, motorcycle_id: Int, rent_start: String, rent_end: String, rent_insurance: Bool) {
        self.id = 0
        self.client_id = client_id
        self.motorcycle_id = motorcycle_id
        self.rent_start = rent_start
        self.rent_end = rent_end
        self.rent_insurance = rent_insurance
    }
}
