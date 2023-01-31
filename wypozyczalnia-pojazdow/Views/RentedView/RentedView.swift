//
//  RentedView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import SwiftUI

struct RentedView: View {
    
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
                    Form {
                        Text(result.car_brand.wrappedValue)
                        Text(result.car_model.wrappedValue)
                        Text("\(result.wrappedValue.id)")
                        Text(result.car_motor.wrappedValue)
                        Text("\(result.car_rent_price_pln.wrappedValue)")
                        Text("\(result.car_transmission.wrappedValue)")
                        Text("\(result.car_mileage_km.wrappedValue)")
                        Text("\(result.car_body_type.wrappedValue)")
                        Text(String(result.car_year.wrappedValue))
                    }
                }
                Text("Historia wypożyczeń")
                List(viewModel.carRentHistory.reversed(), id: \.id) { history in
                    Text("\(history.rent_start) \(history.rent_end)")
                }
            case .motorcycle:
                ForEach($viewModel.motorcycle, id: \.id) { result in
                    Form {
                        Text(result.motorcycle_brand.wrappedValue)
                        Text(result.motorcycle_model.wrappedValue)
                        Text("\(result.wrappedValue.id)")
                        Text(result.motorcycle_motor.wrappedValue)
                        Text("\(result.motorcycle_rent_price_pln.wrappedValue)")
                        Text("\(result.motorcycle_mileage_km.wrappedValue)")
                        Text("\(result.motorcycle_body_type.wrappedValue)")
                        Text(String(result.motorcycle_year.wrappedValue))
                    }
                }
                Text("Historia wypożyczeń")
                List(viewModel.motorcycleRentHistory.reversed(), id: \.id) { history in
                    Text("\(history.rent_start) \(history.rent_end)")
                }
            case .utility:
                ForEach($viewModel.utility, id: \.id) { result in
                    Form {
                        Text(result.utility_brand.wrappedValue)
                        Text(result.utility_model.wrappedValue)
                        Text("\(result.wrappedValue.id)")
                        Text(result.utility_motor.wrappedValue)
                        Text("\(result.utility_rent_price_pln.wrappedValue)")
                        Text("\(result.utility_transmission.wrappedValue)")
                        Text("\(result.utility_mileage_km.wrappedValue)")
                        Text("\(result.utility_type.wrappedValue)")
                        Text(String(result.utility_year.wrappedValue))
                    }
                }
                Text("Historia wypożyczeń")
                List(viewModel.utilityRentHistory.reversed(), id: \.id) { history in
                    Text("\(history.rent_start) \(history.rent_end)")
                }
            default:
                Text("wrong data type")
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

struct RentedView_Previews: PreviewProvider {
    static var previews: some View {
        RentedView(dataType: .car, id: 1)
    }
}
