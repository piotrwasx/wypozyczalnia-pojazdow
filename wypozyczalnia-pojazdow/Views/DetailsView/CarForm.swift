//
//  CarForm.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 31/01/2023.
//

import SwiftUI

struct CarForm: View {
    
    @State var car: Car
    @Binding var confirmationMessage: String
    @Binding var showingConfirmation: Bool
    
    @ObservedObject var viewModel = DetailsViewModel()
    
    var body: some View {
        List {
                Section {
                    TextField("marka:", text: $car.car_brand)
                    TextField("model:", text: $car.car_model)
                    TextField("rodzaj paliwa:", text: $car.car_motor)
                    TextField("cena:", value: $car.car_rent_price_pln, formatter: NumberFormatter())
                    TextField("skrzynia biegów:", text: $car.car_transmission)
                    TextField("typ nadwozia:", text: $car.car_body_type)
                } header: {
                    Text("dane (kliknij, aby edytować)")
                }
            Section {
                Text("\($car.wrappedValue.id)")
            } header: {
                Text("id pojazdu")
            }
        }
    }
}

struct CarForm_Previews: PreviewProvider {
    static var previews: some View {
        CarForm(car: Car(car_brand: "Opel", car_model: "Astra", car_year: 2002, car_mileage_km: 100300, car_transmission: "manual", car_motor: "Petrol", car_body_type: "hatchback", car_rent_price_pln: 600), confirmationMessage: .constant(""), showingConfirmation: .constant(false))
    }
}
