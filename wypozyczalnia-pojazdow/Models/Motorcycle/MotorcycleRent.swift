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
    var rent_insurance: Int
    
    init() {
        self.id = 0
        self.client_id = 0
        self.motorcycle_id = 0
        self.rent_start = ""
        self.rent_end = ""
        self.rent_insurance = 0
    }
}
