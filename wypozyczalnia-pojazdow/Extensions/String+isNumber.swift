//
//  String+isNumber.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 30/01/2023.
//

import Foundation

extension String {
    /// checks if provided string is a number
    var isNumber: Bool {
        return self.range(
            of: "^[0-9]*$", 
            options: .regularExpression) != nil
    }
}
