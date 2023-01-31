//
//  DetailsView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import SwiftUI

struct DetailsView: View {
    
    let dataType: DataTypes
    let id: Int
    
    @StateObject var viewModel = DetailsViewModel()
    
    @State var confirmationMessage = ""
    @State var showingConfirmation = false
    
    var body: some View {
        VStack {
            switch dataType {
            case .car:
                ForEach($viewModel.car, id: \.id) { result in
                    Button("Zapisz") {
                        if viewModel.update(car: result.wrappedValue) {
                            confirmationMessage = "Zaktualizowano dane"
                            showingConfirmation = true
                        } else {
                            confirmationMessage = "Niepowodzenie"
                            showingConfirmation = true
                        }
                    }
                    Form {
                        TextField("", text: result.car_brand)
                        TextField("", text: result.car_model)
                        Text("id pojazdu: \(result.wrappedValue.id)")
                        TextField("", text: result.car_motor)
                        TextField("", value: result.car_rent_price_pln, formatter: NumberFormatter())
                        TextField("", text: result.car_transmission)
                        TextField("", text: result.car_body_type)
                    }
                }
                Spacer()
                Text("Historia wypożyczeń")
                ForEach(viewModel.carRentHistory, id: \.id) { history in
                    Text(history.rent_start)
                }
            case .motorcycle:
                ForEach($viewModel.motorcycle, id: \.id) { result in
                    Button("Zapisz") {
                        if viewModel.update(motorcycle: result.wrappedValue) {
                            confirmationMessage = "Zaktualizowano dane"
                            showingConfirmation = true
                        } else {
                            confirmationMessage = "Niepowodzenie"
                            showingConfirmation = true
                        }
                    }
                    Form {
                        TextField("", text: result.motorcycle_brand)
                        TextField("", text: result.motorcycle_model)
                        Text("id pojazdu: \(result.wrappedValue.id)")
                        TextField("", text: result.motorcycle_motor)
                        TextField("", value: result.motorcycle_rent_price_pln, formatter: NumberFormatter())
                        TextField("", text: result.motorcycle_body_type)
                    }
                }
                Spacer()
                Text("Historia wypożyczeń")
                ForEach(viewModel.motorcycleRentHistory, id: \.id) { history in
                    Text(history.rent_start)
                }
            case .utility:
                ForEach($viewModel.utility, id: \.id) { result in
                    Button("Zapisz") {
                        if viewModel.update(utility: result.wrappedValue) {
                            confirmationMessage = "Zaktualizowano dane"
                            showingConfirmation = true
                        } else {
                            confirmationMessage = "Niepowodzenie"
                            showingConfirmation = true
                        }
                    }
                    Form {
                        TextField("", text: result.utility_brand)
                        TextField("", text: result.utility_model)
                        Text("id pojazdu: \(result.wrappedValue.id)")
                        TextField("", text: result.utility_motor)
                        TextField("", value: result.utility_rent_price_pln, formatter: NumberFormatter())
                        TextField("", text: result.utility_transmission)
                        TextField("", text: result.utility_type)
                    }
                }
                Spacer()
                Text("Historia wypożyczeń")
                List(viewModel.utilityRentHistory, id: \.id) { history in
                    Text(history.rent_start)
                }
            case .client:
                ForEach($viewModel.client, id: \.id) { result in
                    Button("Zapisz") {
                        if viewModel.update(client: result.wrappedValue) {
                            confirmationMessage = "Zaktualizowano dane"
                            showingConfirmation = true
                        } else {
                            confirmationMessage = "Niepowodzenie"
                            showingConfirmation = true
                        }
                    }
                    Form {
                        TextField("imię:", text: result.client_name)
                        TextField("nazwisko:", text: result.client_surname)
                        Text("id klienta: \(result.wrappedValue.id)")
                        TextField("e-mail", text: result.client_email ?? "")
                        TextField("adres:", text: result.client_address)
                        TextField("miasto:", text: result.client_city)
                        TextField("numer telefonu:", text: result.client_phone_nr)
                        TextField("data wydania prawa jazdy:", text: result.client_driving_license_since)
                    }
                }
                Spacer()
                Text("Historia wypożyczeń")
                List(viewModel.clientRentHistory, id: \.id) { history in
                    Text("\(history.car_model) - koszt: \(history.total_price_with_insurance)")
                }
            case .rent:
                Text("todo")
            }
            
        }
        .onAppear {
            viewModel.loadInfo(id: id, dataType: dataType)
            viewModel.loadRentHistory(id: id, dataType: dataType)
        }
        .alert("Powiadomienie", isPresented: $showingConfirmation) {}
    message: {
        Text(confirmationMessage)
    }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(dataType: .car, id: 1)
    }
}
