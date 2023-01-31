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

    func isClientDataValid(client: Client) -> Bool {
        if client.client_surname.isEmpty || client.client_name.isEmpty || client.client_address.isEmpty || client.client_city.isEmpty || client.client_driving_license_since.isEmpty || client.client_phone_nr.isEmpty {
            return false
        }
        if client.client_name.isNumber || client.client_surname.isNumber || client.client_address.isNumber || client.client_city.isNumber {
            return false
        }
        if client.client_email != nil {
            if client.client_email!.isValidEmail() {
                return true
            } else {
                return false
            }
        }
        return true
    }
}
