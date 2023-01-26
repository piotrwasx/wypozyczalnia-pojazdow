//
//  CarRent.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import Foundation

struct CarRent: Codable {
    var id, client_id, car_id: Int
    var rent_start, rent_end: String
    var rent_insurance: Int
    
    init() {
        self.id = 0
        self.client_id = 0
        self.car_id = 0
        self.rent_start = ""
        self.rent_end = ""
        self.rent_insurance = 0
    }
}
