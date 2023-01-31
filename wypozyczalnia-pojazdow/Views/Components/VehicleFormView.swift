//
//  VehicleFormView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 28/01/2023.
//

import SwiftUI

struct VehicleFormView: View {
    
    @ObservedObject var viewModel: AddItemViewModel
    let dataType: DataTypes
    
    @Binding var showingConfirmation: Bool
    @Binding var confirmationMessage: String
    
    @State var model = ""
    @State var brand = ""
    @State var type = ""
    @State var motor = ""
    @State var transmission = ""
    @State var mileage = 0
    @State var productionDate = 0
    @State var price = 0
    
    var body: some View {
        VStack {
            Form {
                Section {
                    switch dataType {
                    case .car:
                        Text("Dodaj nowy samochód")
                            .font(.title)

                    case .motorcycle:
                        Text("Dodaj nowy motocykl")
                            .font(.title)

                    case .utility:
                        Text("Dodaj nowy pojazd specjalny")
                            .font(.title)

                    default:
                        Text("")
                    }
                }
                Section {
                    TextField("Model *", text: $model)
                    TextField("Marka *", text: $brand)
                    TextField("Typ nadwozia *", text: $type)
                    TextField("Rodzaj paliwa *", text: $motor)
                    TextField("przebieg [km] *", value: $mileage, format: .number)
                        .keyboardType(.numberPad)
                    if (dataType == .car || dataType == .utility) {
                        TextField("rodzaj skrzyni biegów *", text: $transmission)
                    }
                    TextField("cena *", value: $price, format: .number)
                    Picker("", selection: $productionDate) {
                        ForEach(2000...2023, id: \.self) {
                            Text(String($0))
                        }
                    }
                    .pickerStyle(.automatic)
                }
                Button("Zatwierdź dane") {
                    switch dataType {
                    case .car:
                        let car = Car(car_brand: brand, car_model: model, car_year: productionDate, car_mileage_km: mileage, car_transmission: transmission, car_motor: motor, car_body_type: type, car_rent_price_pln: price)
                        
                        if viewModel.processData(car: car) {
                            confirmationMessage = "Dodano nowy samochód"
                        } else {
                            confirmationMessage = "Niepowodzenie"
                        }
                        showingConfirmation = true
                    case .motorcycle:
                        let motorcycle = Motorcycle(motorcycle_model: model, motorcycle_brand: brand, motorcycle_year: productionDate, motorcycle_mileage_km: mileage, motorcycle_motor: motor, motorcycle_body_type: type, motorcycle_rent_price_pln: price)
                        if viewModel.processData(motorcycle: motorcycle) {
                            confirmationMessage = "Dodano nowy motocykl"
                        } else {
                            confirmationMessage = "Niepowodzenie"
                        }
                        showingConfirmation = true
                    case .utility:
                        let utility = Utility(utility_brand: brand, utility_model: model, utility_year: productionDate, utility_mileage_km: mileage, utility_transmission: transmission, utility_motor: motor, utility_type: type, utility_rent_price_pln: price)
                        if viewModel.processData(utility: utility) {
                            confirmationMessage = "Dodano nową ciężarówkę"
                        } else {
                            confirmationMessage = "Niepowodzenie"
                        }
                        showingConfirmation = true
                        
                    default:
                        return
                    }
                }
            }
        }
    }
}

struct VehicleForm_Previews: PreviewProvider {
    static var previews: some View {
        VehicleFormView(viewModel: AddItemViewModel(), dataType: .utility, showingConfirmation: .constant(false), confirmationMessage: .constant(""))
    }
}
