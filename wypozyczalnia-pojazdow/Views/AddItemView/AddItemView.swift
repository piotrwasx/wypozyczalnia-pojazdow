//
//  AddItemView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 27/01/2023.
//

import SwiftUI

struct AddItemView: View {
    
    let dataType: DataTypes
    
    @State private var showConfirmationAlert = false
    @State private var confirmationMessage = ""
    
    var body: some View {
        VStack {
            switch dataType {
            case .client:
                ClientFormView(viewModel: AddItemViewModel(), showingConfirmation: $showConfirmationAlert, confirmationMessage: $confirmationMessage)
            case .utility:
                VehicleFormView(viewModel: AddItemViewModel(), dataType: .utility, showingConfirmation: $showConfirmationAlert, confirmationMessage: $confirmationMessage)
            case .motorcycle:
                VehicleFormView(viewModel: AddItemViewModel(), dataType: .motorcycle, showingConfirmation: $showConfirmationAlert, confirmationMessage: $confirmationMessage)
            case .car:
                VehicleFormView(viewModel: AddItemViewModel(), dataType: .car, showingConfirmation: $showConfirmationAlert, confirmationMessage: $confirmationMessage)
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
