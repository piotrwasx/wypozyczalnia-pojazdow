//
//  AddItemView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 27/01/2023.
//

import SwiftUI

struct AddItemView: View {
    
    let dataType: DataTypes = .car
    
    @State private var showingConfirmation = false
    @State private var confirmationMessage = ""
    
    var body: some View {
        VStack {
            switch dataType {
            case .client:
                ClientFormView(showingConfirmation: $showingConfirmation, confirmationMessage: $confirmationMessage)
            case .utility:
                UtilityFormView(showingConfirmation: $showingConfirmation, confirmationMessage: $confirmationMessage)
            case .motorcycle:
                MotorcycleFormView(showingConfirmation: $showingConfirmation, confirmationMessage: $confirmationMessage)
            case .car:
                CarFormView(showingConfirmation: $showingConfirmation, confirmationMessage: $confirmationMessage)
            }
        }
        .alert("Gratulacje", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
