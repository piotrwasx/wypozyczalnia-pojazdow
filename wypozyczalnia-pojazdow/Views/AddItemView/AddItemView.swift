//
//  AddItemView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 27/01/2023.
//

import SwiftUI

/// A view with forms to add new records to database
struct AddItemView: View {
    
    /// enumerated type of data to handle by the view
    let dataType: DataType
    
    @State private var showConfirmationAlert = false
    @State private var confirmationMessage = ""
    
    var body: some View {
        VStack {
            switch dataType {
            case .client:
                ClientFormView(showingConfirmation: $showConfirmationAlert, confirmationMessage: $confirmationMessage)
            case .utility:
                VehicleFormView(dataType: .utility, showingConfirmation: $showConfirmationAlert, confirmationMessage: $confirmationMessage)
            case .motorcycle:
                VehicleFormView(dataType: .motorcycle, showingConfirmation: $showConfirmationAlert, confirmationMessage: $confirmationMessage)
            case .car:
                VehicleFormView(dataType: .car, showingConfirmation: $showConfirmationAlert, confirmationMessage: $confirmationMessage)
            case .rent:
                VehicleFormView(dataType: .rent, showingConfirmation: $showConfirmationAlert, confirmationMessage: $confirmationMessage)

            }
        }
        .alert("Powiadomienie", isPresented: $showConfirmationAlert) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(dataType: .car)
    }
}
