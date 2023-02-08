//
//  String+Split.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 31/01/2023.
//

import Foundation

extension String {
    /// this method cuts a String of Date into more readable format
    /// - Returns: returns new String
    func formatDateTime() -> String{
        return self.split(separator: "T").map { String($0) }[0]
    }
}
