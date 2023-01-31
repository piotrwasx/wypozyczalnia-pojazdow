//
//  MotorcycleForm.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 31/01/2023.
//

import SwiftUI

struct MotorcycleForm: View {
    
    @State var motorcycle: Motorcycle
    @Binding var confirmationMessage: String
    @Binding var showingConfirmation: Bool
    
    @ObservedObject var viewModel = DetailsViewModel()
    
    var body: some View {
        List {
            Section {
                TextField("marka:", text: $motorcycle.motorcycle_brand)
                TextField("model:", text: $motorcycle.motorcycle_model)
                Text("id: \($motorcycle.wrappedValue.id)")
                TextField("rodzaj paliwa:", text: $motorcycle.motorcycle_motor)
                TextField("cena:", value: $motorcycle.motorcycle_rent_price_pln, formatter: NumberFormatter())
                TextField("typ nadwozia:", text: $motorcycle.motorcycle_body_type)
            }
        }
    }
}

struct MotorcycleForm_Previews: PreviewProvider {
    static var previews: some View {
        MotorcycleForm(motorcycle: Motorcycle(), confirmationMessage: .constant(""), showingConfirmation: .constant(false))
    }
}
