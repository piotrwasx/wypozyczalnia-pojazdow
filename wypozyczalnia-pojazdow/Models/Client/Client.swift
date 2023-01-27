//
//  Client.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 27/01/2023.
//

import Foundation

struct Client: Codable {
    var id: Int
    var client_name, client_surname, client_address, client_city, client_phone_nr: String
    var client_email: String?
    var client_driving_license_since: String
    
    init() {
        self.id = 0
        self.client_name = ""
        self.client_surname = ""
        self.client_address = ""
        self.client_city = ""
        self.client_phone_nr = ""
        self.client_email = ""
        self.client_driving_license_since = ""
    }
}
