//
//  ClientRent.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 27/01/2023.
//

import Foundation

struct ClientRent: Codable {
    var id, client_id, car_id: Int
    var client_name, client_surname, client_phone_nr: String
    var car_brand, car_model: String
    var car_rent_price_pln: Int
    var rent_start, rent_end: String
    var total_cost: Int
    var rent_insurance: Bool
    var days_rented, total_price_with_insurance: Int
    var vehicle: String
    
    init() {
        self.id = 0
        self.client_id = 0
        self.client_name = ""
        self.client_surname = ""
        self.client_phone_nr = ""
        self.car_id = 0
        self.car_brand = ""
        self.car_model = ""
        self.car_rent_price_pln = 0
        self.rent_start = ""
        self.rent_end = ""
        self.rent_insurance = false
        self.days_rented = 0
        self.total_cost = 0
        self.total_price_with_insurance = 0
        self.vehicle = ""
    }
}
