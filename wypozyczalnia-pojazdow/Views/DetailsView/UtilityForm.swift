//
//  UtilityForm.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 31/01/2023.
//

import SwiftUI

struct UtilityForm: View {
    
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
                TextField("cena:", value: $utility.utility_rent_price_pln, formatter: NumberFormatter())
                TextField("skrzynia biegów", text: $utility.utility_transmission)
                TextField("typ nadwozia", text: $utility.utility_type)
            } header: {
                Text("dane (kliknij, aby edytować)")
            }
            Section {
                Text("id pojazdu: \($utility.wrappedValue.id)")
            } header: {
                Text("id pojazdu")
            }
        }
    }
}

struct UtilityForm_Previews: PreviewProvider {
    static var previews: some View {
        UtilityForm(utility: Utility(), confirmationMessage: .constant(""), showingConfirmation: .constant(false))
    }
}
