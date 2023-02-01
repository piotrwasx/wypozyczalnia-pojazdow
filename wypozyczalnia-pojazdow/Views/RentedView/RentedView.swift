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
            HStack {
                Text("Wypożyczony")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 30)
                    .padding(.bottom, -5)
                Spacer()
            }
            switch dataType {
            case .car:
                Form {
                    ForEach($viewModel.car, id: \.id) { result in
                        Section {
                            Text(result.car_brand.wrappedValue)
                                .font(.title)
                                .fontWeight(.semibold)
                            Text(result.car_model.wrappedValue)
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                        Section {
                            Text("id: \(result.wrappedValue.id)")
                            Text(result.car_motor.wrappedValue)
                            Text("stawka: \(result.car_rent_price_pln.wrappedValue)zł")
                            Text("\(result.car_transmission.wrappedValue)")
                            Text("przebieg: \(result.car_mileage_km.wrappedValue)km")
                            Text("\(result.car_body_type.wrappedValue)")
                            Text(String(result.car_year.wrappedValue))
                        }
                        Section {
                            Text("Historia wypożyczeń")
                                .fontWeight(.semibold)
                            List(viewModel.carRentHistory.reversed(), id: \.id) { history in
                                Text("od: \(history.rent_start.formatDateTime())\ndo: \(history.rent_end.formatDateTime())")
                            }
                        }
                    }
                }
            case .motorcycle:
                Form {
                    ForEach($viewModel.motorcycle, id: \.id) { result in
                        Section {
                            Text(result.motorcycle_brand.wrappedValue)
                                .font(.title)
                                .fontWeight(.semibold)
                            Text(result.motorcycle_model.wrappedValue)
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                        Section {
                            Text("id: \(result.wrappedValue.id)")
                            Text(result.motorcycle_motor.wrappedValue)
                            Text("\(result.motorcycle_rent_price_pln.wrappedValue) zł")
                            Text("\(result.motorcycle_mileage_km.wrappedValue) km")
                            Text("\(result.motorcycle_body_type.wrappedValue)")
                            Text(String(result.motorcycle_year.wrappedValue))
                        }
                        Section {
                            Text("Historia wypożyczeń")
                                .fontWeight(.semibold)
                            List(viewModel.motorcycleRentHistory.reversed(), id: \.id) { history in
                                Text("od: \(history.rent_start.formatDateTime())\ndo: \(history.rent_end.formatDateTime())")
                            }
                        }
                    }
                }
            case .utility:
                Form {
                    ForEach($viewModel.utility, id: \.id) { result in
                        Section {
                            Text(result.utility_brand.wrappedValue)
                                .font(.title)
                                .fontWeight(.semibold)
                            Text(result.utility_model.wrappedValue)
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                        Section {
                            Text("id: \(result.wrappedValue.id)")
                            Text(result.utility_motor.wrappedValue)
                            Text("\(String(result.utility_rent_price_pln.wrappedValue)) zł")
                            Text("\(result.utility_transmission.wrappedValue)")
                            Text("\(result.utility_mileage_km.wrappedValue) km")
                            Text("\(result.utility_type.wrappedValue)")
                            Text(String(result.utility_year.wrappedValue))
                        }
                        Section {
                            Text("Historia wypożyczeń")
                                .fontWeight(.semibold)
                            if viewModel.utilityRentHistory.isEmpty {
                                Text("brak danych")
                            } else {
                                List(viewModel.utilityRentHistory.reversed(), id: \.id) { history in
                                    Text("od: \(history.rent_start.formatDateTime())\ndo: \(history.rent_end.formatDateTime())")
                                }
                            }
                        }
                    }
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
        RentedView(dataType: .utility, id: 1)
    }
}
