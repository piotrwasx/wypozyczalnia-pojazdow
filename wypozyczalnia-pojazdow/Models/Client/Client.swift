//
//  Client.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 27/01/2023.
//

import Foundation

struct Client: Codable {
    var id: Int
    var client_name, client_surname, client_address, client_street_nr, client_city, client_phone_nr: String
    var client_email: String?
    var client_driving_license_since: String
    
    init() {
        self.id = 0
        self.client_name = ""
        self.client_surname = ""
        self.client_address = ""
        self.client_street_nr = ""
        self.client_city = ""
        self.client_phone_nr = ""
        self.client_email = ""
        self.client_driving_license_since = ""
    }
    

    func isClientDataValid() -> Bool {
        if self.client_surname.isEmpty || self.client_name.isEmpty || self.client_address.isEmpty || self.client_street_nr.isEmpty || self.client_city.isEmpty || self.client_driving_license_since.isEmpty || self.client_phone_nr.isEmpty {
            return false
        }
        if self.client_name.isNumber || self.client_surname.isNumber || self.client_address.isNumber || self.client_city.isNumber {
            return false
        }
        if self.client_email != nil {
            if self.client_email!.isValidEmail() {
                return true
            } else {
                return false
            }
        }
        return true
    }
}
