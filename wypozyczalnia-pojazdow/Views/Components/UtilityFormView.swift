//
//  UtilityFormView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 28/01/2023.
//

import SwiftUI

struct UtilityFormView: View {
    
    @State private var utility = Utility()
    
    @Binding var showingConfirmation: Bool
    @Binding var confirmationMessage: String
    
    var body: some View {
        VStack {
            Text("Dodaj nową ciężarówkę")
                .font(.title)
            TextField("Model *", text: $utility.utility_model)
            TextField("Marka *", text: $utility.utility_brand)
            TextField("Typ nadwozia *", text: $utility.utility_type)
            TextField("Rodzaj paliwa *", text: $utility.utility_motor)
            TextField("Skrzynia biegów *", text: $utility.utility_transmission)
            TextField("przebieg [km] *", value: $utility.utility_mileage_km, format: .number)
                .keyboardType(.numberPad)
            TextField("rok produkcji *", value: $utility.utility_year, format: .number)
            TextField("cena *", value: $utility.utility_rent_price_pln, format: .number)
            
            Button("Zatwierdź dane") {
                Task {
                    confirmationMessage = await NetworkController.sendData(url: "http://127.0.0.1:5000/api/utilities/", dataToSend: utility)
                    showingConfirmation = true
                }
            }
        }
    }
}

struct UtilityFormViewViewPreviews: PreviewProvider {
    static var previews: some View {
        UtilityFormView(showingConfirmation: .constant(false), confirmationMessage: .constant(""))
    }
}
