//
//  CarDetails.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 31/01/2023.
//

import SwiftUI

/// Detailed view of specific ''Car''
struct CarDetails: View {
    
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
                    TextField("skrzynia biegów:", text: $car.car_transmission)
                    TextField("typ nadwozia:", text: $car.car_body_type)
                } header: {
                    Text("dane (kliknij, aby edytować)")
                }
            
            Section {
                TextField("przebieg [km]:", value: $car.car_mileage_km, formatter: NumberFormatter())
            } header: {
                Text("przebieg")
            }
            Section {
                TextField("rok produkcji:", value: $car.car_year, formatter: NumberFormatter())
            } header: {
                Text("rok produkcji")
            }
            Section {
                TextField("cena:", value: $car.car_rent_price_pln, formatter: NumberFormatter())
            } header: {
                Text("cena")
            }
            Section {
                Text("\($car.wrappedValue.id)")
            } header: {
                Text("id pojazdu")
            }
            Section {
                Button("Zapisz zmiany") {
                    if viewModel.update(car: car) {
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

struct CarDetails_Previews: PreviewProvider {
    static var previews: some View {
        CarDetails(car: Car(car_brand: "Opel", car_model: "Astra", car_year: 2002, car_mileage_km: 100300, car_transmission: "manual", car_motor: "Petrol", car_body_type: "hatchback", car_rent_price_pln: 600), confirmationMessage: .constant(""), showingConfirmation: .constant(false))
    }
}
