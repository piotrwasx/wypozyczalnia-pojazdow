//
//  MotorcycleDetails.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 31/01/2023.
//

import SwiftUI

/// Detailed view of specific ''Motorcycle''
struct MotorcycleDetails: View {
    
    @State var motorcycle: Motorcycle
    @Binding var confirmationMessage: String
    @Binding var showingConfirmation: Bool
    
    @ObservedObject var viewModel = DetailsViewModel()
    
    var body: some View {
        List {
            Section {
                Text("id pojazdu: \($motorcycle.wrappedValue.id)")
                TextField("marka:", text: $motorcycle.motorcycle_brand)
                TextField("model:", text: $motorcycle.motorcycle_model)
                TextField("rodzaj paliwa:", text: $motorcycle.motorcycle_motor)
                TextField("typ nadwozia:", text: $motorcycle.motorcycle_body_type)
            } header: {
                Text("dane (kliknij, aby edytować)")
            }
            Section {
                HStack {
                    Text("przebieg:")
                    TextField("", value: $motorcycle.motorcycle_mileage_km, formatter: NumberFormatter())
                }
                HStack {
                    Text("rok produkcji:")
                    TextField("rok produkcji:", value: $motorcycle.motorcycle_year, formatter: NumberFormatter())
                }
                HStack {
                    Text("cena:")
                    TextField("cena:", value: $motorcycle.motorcycle_rent_price_pln, formatter: NumberFormatter())
                }
            } header: {
                Text("dane numeryczne")
            }
            
            Section {
                Button("Zapisz zmiany") {
                    if viewModel.update(motorcycle: motorcycle) {
                        confirmationMessage = "Zaktualizowano dane"
                        showingConfirmation = true
                    } else {
                        confirmationMessage = "Niepowodzenie"
                        showingConfirmation = true
                    }
                    hideKeyboard()
                }
            }
        }
    }
}

struct MotorcycleDetails_Previews: PreviewProvider {
    static var previews: some View {
        MotorcycleDetails(motorcycle: Motorcycle(), confirmationMessage: .constant(""), showingConfirmation: .constant(false))
    }
}
