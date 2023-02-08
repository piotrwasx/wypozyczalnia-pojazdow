//
//  NewRentView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 01/02/2023.
//

import SwiftUI

/// A view of adding a new rent to database
struct NewRentForm: View {
    
    @ObservedObject var viewModel = NewRentFormModel()
    
    @State var showingConfirmation = false
    @State var confirmationMessage = ""
    
    @State var vehicleTypes: VehicleType = .car
    @State var client_id = 1
    @State var id = 1
    @State var price = 0
    @State var rent_insurance = false
    @State var rent_end = Date()
    
    let rent_start = Date()
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Text("Wypożycz pojazd")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
                Section {
                    Picker("", selection: $vehicleTypes) {
                        ForEach(VehicleType.allCases, id: \.self) { item in
                            Text("\(item.rawValue)")
                        }
                    }
                } header: {
                    Text("Rodzaj pojazdu")
                }
                Section {
                    Picker("Kto:", selection: $client_id) {
                        ForEach($viewModel.clientDataRows, id: \.id) { item in
                            Text(item.wrappedValue.toString())
                        }
                    }
                    Picker("Co:", selection: $id) {
                        ForEach($viewModel.vehicleDataRows, id: \.id) { item in
                            Text(item.wrappedValue.toString())
                        }
                    }
                } header: {
                    Text("dane")
                }
                Section {
                    DatePicker("Data zakończenia:", selection: $rent_end, in: Date.now..., displayedComponents: .date)
                        .datePickerStyle(.graphical)
                } header: {
                    Text("Data zakończenia")
                }
                Section {
                    Toggle("Ubezpieczenie: ", isOn: $rent_insurance)
                }
                Button("Zatwierdź dane") {
                    switch vehicleTypes {
                    case .car:
                        let car = CarRent(client_id: $client_id.wrappedValue, car_id: $id.wrappedValue, rent_start: dateFormatter.string(from: rent_start), rent_end: dateFormatter.string(from: $rent_end.wrappedValue), rent_insurance: $rent_insurance.wrappedValue)
                        Task {
                            await viewModel.sendData(newRent: car)
                            confirmationMessage = "Przesłano dane"
                            showingConfirmation = true
                        }
                    case .motorcycle:
                        let motorcycle = MotorcycleRent(client_id: $client_id.wrappedValue, motorcycle_id: $id.wrappedValue, rent_start: dateFormatter.string(from: rent_start), rent_end: dateFormatter.string(from: $rent_end.wrappedValue), rent_insurance: $rent_insurance.wrappedValue)
                        Task {
                            await viewModel.sendData(newRent: motorcycle)
                            confirmationMessage = "Przesłano dane"
                            showingConfirmation = true
                        }
                    case .utility:
                        let utility = UtilityRent(client_id: $client_id.wrappedValue, utility_id: $id.wrappedValue, rent_start: dateFormatter.string(from: rent_start), rent_end: dateFormatter.string(from: $rent_end.wrappedValue), rent_insurance: $rent_insurance.wrappedValue)
                        
                        Task {
                            await viewModel.sendData(newRent: utility)
                            confirmationMessage = "Dodano nową ciężarówkę"
                            showingConfirmation = true
                        }
                    }
                }
            }
            .onAppear() {
                viewModel.fetchClientTitles()
                viewModel.fetchVehicleTitles(vehicleType: $vehicleTypes.wrappedValue)
            }
        }
        .onChange(of: $vehicleTypes.wrappedValue) { newValue in
            viewModel.fetchVehicleTitles(vehicleType: newValue)
        }
        .alert("Powiadomienie", isPresented: $showingConfirmation) {
            Button("OK") {}
        }
    message: {
        Text($confirmationMessage.wrappedValue)
    }
    }
}

struct NewRentForm_Previews: PreviewProvider {
    static var previews: some View {
        NewRentForm()
    }
}
