//
//  String+isValidEmail.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 30/01/2023.
//

import Foundation

extension String {
    /// checks if provided String is a valid e-mail address
    /// - Returns: returns Boolean
    func isValidEmail() -> Bool {
        // email is an optional so empty email is also a vaild email
        if self == "" {
            return true
        }
        let regex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" , options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
