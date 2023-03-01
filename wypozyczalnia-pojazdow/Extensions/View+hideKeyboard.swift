//
//  View+hideKeyboard.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 01/03/2023.
//

import SwiftUI
import UIKit

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
