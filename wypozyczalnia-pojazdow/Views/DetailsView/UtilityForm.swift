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
                TextField("", text: $utility.utility_brand)
                TextField("", text: $utility.utility_model)
                Text("id pojazdu: \($utility.wrappedValue.id)")
                TextField("", text: $utility.utility_motor)
                TextField("", value: $utility.utility_rent_price_pln, formatter: NumberFormatter())
                TextField("", text: $utility.utility_transmission)
                TextField("", text: $utility.utility_type)
            }
        }
    }
}

struct UtilityForm_Previews: PreviewProvider {
    static var previews: some View {
        UtilityForm(utility: Utility(), confirmationMessage: .constant(""), showingConfirmation: .constant(false))
    }
}
