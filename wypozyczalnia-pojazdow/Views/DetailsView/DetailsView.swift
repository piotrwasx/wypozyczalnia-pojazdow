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
                Form {
                    ForEach($viewModel.car, id: \.id) { result in
                        CarForm(car: result.wrappedValue, confirmationMessage: $confirmationMessage, showingConfirmation: $showingConfirmation)
                        Section {
                            Button("Zapisz zmiany") {
                                if viewModel.update(car: result.wrappedValue) {
                                    confirmationMessage = "Zaktualizowano dane"
                                    showingConfirmation = true
                                } else {
                                    confirmationMessage = "Niepowodzenie"
                                    showingConfirmation = true
                                }
                            }
                        }
                        Section {
                            Text("Historia wypożyczeń")
                                .fontWeight(.semibold)
                            List(viewModel.carRentHistory, id: \.id) { history in
                                Text("oddanie: \(history.rent_end.formatDateTime())")
                            }
                        }
                    }
                }
            case .motorcycle:
                Form {
                    ForEach($viewModel.motorcycle, id: \.id) { result in
                        MotorcycleForm(motorcycle: result.wrappedValue, confirmationMessage: $confirmationMessage, showingConfirmation: $showingConfirmation)
                        Section {
                            Button("Zapisz zmiany") {
                                if viewModel.update(motorcycle: result.wrappedValue) {
                                    confirmationMessage = "Zaktualizowano dane"
                                    showingConfirmation = true
                                } else {
                                    confirmationMessage = "Niepowodzenie"
                                    showingConfirmation = true
                                }
                            }
                        }
                        Section {
                            Text("Historia wypożyczeń")
                                .fontWeight(.semibold)
                            ForEach(viewModel.motorcycleRentHistory, id: \.id) { history in
                                Text("oddanie: \(history.rent_end.formatDateTime())")
                            }
                        }
                    }
                }
                
            case .utility:
                Form {
                    ForEach($viewModel.utility, id: \.id) { result in
                        Section {
                            UtilityForm(utility: result.wrappedValue, confirmationMessage: $confirmationMessage, showingConfirmation: $showingConfirmation)
                        }
                        Section {
                            Button("Zapisz zmiany") {
                                if viewModel.update(utility: result.wrappedValue) {
                                    confirmationMessage = "Zaktualizowano dane"
                                    showingConfirmation = true
                                } else {
                                    confirmationMessage = "Niepowodzenie"
                                    showingConfirmation = true
                                }
                            }
                        }
                        Section {
                            Text("Historia wypożyczeń")
                                .fontWeight(.semibold)
                            List(viewModel.utilityRentHistory, id: \.id) { history in
                                Text("oddanie: \(history.rent_end.formatDateTime())")
                            }
                        }
                    }
                }
            case .client:
                Form {
                    ForEach($viewModel.client, id: \.id) { result in
                        ClientForm(client: result.wrappedValue, confirmationMessage: $confirmationMessage, showingConfirmation: $showingConfirmation)
                        
                        Section {
                            Button("Zapisz zmiany") {
                                if viewModel.update(client: result.wrappedValue) {
                                    confirmationMessage = "Zaktualizowano dane"
                                    showingConfirmation = true
                                } else {
                                    confirmationMessage = "Niepowodzenie"
                                    showingConfirmation = true
                                }
                            }
                        }
                        
                        Section {
                            Text("Historia wypożyczeń")
                                .fontWeight(.semibold)
                            List(viewModel.clientRentHistory, id: \.id) { history in
                                Text("\(history.car_model) - koszt: \(history.total_price_with_insurance)\noddanie: \(history.rent_end.formatDateTime())")
                            }
                        }
                    }
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
        DetailsView(dataType: .car, id: 3)
    }
}
