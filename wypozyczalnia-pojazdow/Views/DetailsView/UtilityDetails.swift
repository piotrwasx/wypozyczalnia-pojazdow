//
//  UtilityDetails.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 31/01/2023.
//

import SwiftUI

/// Detailed view of specific ''Utility''
struct UtilityDetails: View {
    
    @State var utility: Utility
    @Binding var confirmationMessage: String
    @Binding var showingConfirmation: Bool
    
    @ObservedObject var viewModel = DetailsViewModel()
    
    var body: some View {
        List {
            Section {
                TextField("marka:", text: $utility.utility_brand)
                TextField("model:", text: $utility.utility_model)
                TextField("rodzaj paliwa:", text: $utility.utility_motor)
                TextField("skrzynia biegów", text: $utility.utility_transmission)
                TextField("typ nadwozia", text: $utility.utility_type)
            } header: {
                Text("dane (kliknij, aby edytować)")
            }
            Section {
                TextField("przebieg:", value: $utility.utility_mileage_km, formatter: NumberFormatter())
            } header: {
                Text("przebieg")
            }
            Section {
                TextField("rok produkcji:", value: $utility.utility_year, formatter: NumberFormatter())
            } header: {
                Text("rok produkcji")
            }
            Section {
                TextField("cena:", value: $utility.utility_rent_price_pln, formatter: NumberFormatter())
            } header: {
                Text("cena")
            }
            
            Section {
                Text("id pojazdu: \($utility.wrappedValue.id)")
            } header: {
                Text("id pojazdu")
            }
            
            Section {
                Button("Zapisz zmiany") {
                    if viewModel.update(utility: utility) {
                        confirmationMessage = "Zaktualizowano dane"
                        showingConfirmation = true
                    } else {
                        confirmationMessage = "Niepowodzenie"
                        showingConfirmation = true
                    }
                }
            }
        }
    }
}

struct UtilityDetails_Previews: PreviewProvider {
    static var previews: some View {
        UtilityDetails(utility: Utility(), confirmationMessage: .constant(""), showingConfirmation: .constant(false))
    }
}
