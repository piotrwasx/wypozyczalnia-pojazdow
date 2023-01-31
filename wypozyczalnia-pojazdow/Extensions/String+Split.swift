//
//  String+Split.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 31/01/2023.
//

import Foundation

extension String {
    func formatDateTime() -> String{
        return self.split(separator: "T").map { String($0) }[0]
    }
}
