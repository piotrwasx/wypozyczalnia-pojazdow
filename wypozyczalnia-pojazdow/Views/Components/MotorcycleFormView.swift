//
//  MotorcycleFormView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 28/01/2023.
//

import SwiftUI

struct MotorcycleFormView: View {
    
    @State private var motorcycle = Motorcycle()
    
    @Binding var showingConfirmation: Bool
    @Binding var confirmationMessage: String
    
    var body: some View {
        VStack {
            Text("Dodaj nowy motocykl")
                .font(.title)
            TextField("Model *", text: $motorcycle.motorcycle_model)
            TextField("Marka *", text: $motorcycle.motorcycle_brand)
            TextField("Typ nadwozia *", text: $motorcycle.motorcycle_body_type)
            TextField("Rodzaj paliwa *", text: $motorcycle.motorcycle_motor)
            TextField("przebieg [km] *", value: $motorcycle.motorcycle_mileage_km, format: .number)
                .keyboardType(.numberPad)
            TextField("rok produkcji *", value: $motorcycle.motorcycle_year, format: .number)
            TextField("cena *", value: $motorcycle.motorcycle_rent_price_pln, format: .number)
            
            Button("Zatwierdź dane") {
                Task {
                    confirmationMessage = await NetworkController.sendData(url: "http://127.0.0.1:5000/api/motorcycles/", dataToSend: motorcycle)
                    showingConfirmation = true
                }
            }
        }
    }
}

struct MotorcycleFormViewPreviews: PreviewProvider {
    static var previews: some View {
        MotorcycleFormView(showingConfirmation: .constant(false), confirmationMessage: .constant(""))
    }
}
