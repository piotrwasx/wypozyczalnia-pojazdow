//
//  CarFormView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 28/01/2023.
//

import SwiftUI

struct CarFormView: View {
    
    @State private var car = Car()
    
    @Binding var showingConfirmation: Bool
    @Binding var confirmationMessage: String
    
    var body: some View {
        VStack {
            Text("Dodaj nowy samochód")
                .font(.title)
            TextField("Model *", text: $car.car_model)
            TextField("Marka *", text: $car.car_brand)
            TextField("Typ nadwozia *", text: $car.car_body_type)
            TextField("Rodzaj paliwa *", text: $car.car_motor)
            TextField("przebieg [km] *", value: $car.car_mileage_km, format: .number)
                .keyboardType(.numberPad)
            TextField("rodzaj skrzyni biegów *", text: $car.car_transmisson)
            TextField("rok produkcji *", value: $car.car_year, format: .number)
            TextField("cena *", value: $car.car_rent_price_pln, format: .number)
            
            Button("Zatwierdź dane") {
                Task {
                    confirmationMessage = await NetworkController.sendData(url: "http://127.0.0.1:5000/api/cars/", dataToSend: car)
                    showingConfirmation = true
                }
            }
        }
    }
}

struct CarFormView_Previews: PreviewProvider {
    static var previews: some View {
        CarFormView(showingConfirmation: .constant(false), confirmationMessage: .constant(""))
    }
}
