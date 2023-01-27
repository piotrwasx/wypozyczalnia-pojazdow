//
//  DetailsView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import SwiftUI

struct DetailsView: View {
    
    @StateObject var viewModel = DetailsViewModel()
    let dataType: String
    let id: Int
    
    var body: some View {
        VStack {
            switch dataType {
            case "Car":
                List(viewModel.car, id: \.id) { result in
                    Text(result.car_brand)
                    Text(result.car_model)
                    Text(String(result.id))
                    Text(result.car_motor)
                    Text(String(result.car_rent_price_pln))
                    Text(result.car_transmisson)
                    Text(result.car_body_type)
                }
                Spacer()
                    .frame(height: 10)
                Text("Historia wypożyczeń")
                List(viewModel.carRentHistory, id: \.id) { history in
                    Text(history.rent_start)
                }
            case "Motorcycle":
                List(viewModel.motorcycle, id: \.id) { result in
                    Text(result.motorcycle_brand)
                    Text(result.motorcycle_model)
                    Text(String(result.id))
                    Text(result.motorcycle_motor)
                    Text(String(result.motorcycle_rent_price_pln))
                    Text(result.motorcycle_body_type)
                }
                Spacer()
                    .frame(height: 10)
                Text("Historia wypożyczeń")
                List(viewModel.motorcycleRentHistory, id: \.id) { history in
                    Text(history.rent_start)
                }
            case "Utility":
                List(viewModel.utility, id: \.id) { result in
                    Text(result.utility_brand)
                    Text(result.utility_model)
                    Text(String(result.id))
                    Text(result.utility_motor)
                    Text(String(result.utility_rent_price_pln))
                    Text(result.utility_transmission)
                    Text(result.utility_type)
                }
                Spacer()
                    .frame(height: 10)
                Text("Historia wypożyczeń")
                List(viewModel.utilityRentHistory, id: \.id) { history in
                    Text(history.rent_start)
                }
            case "Client":
                List(viewModel.client, id: \.id) { result in
                    Text(result.client_name)
                    Text(result.client_surname)
                    Text("id klinenta: \(result.id)")
                    Text(result.client_email ?? "brak e-maila")
                    Text(result.client_address)
                    Text(result.client_city)
                    Text("\(result.client_phone_nr)")
                    Text("Prawo jazdy od: \(result.client_driving_license_since)")
                }
                Spacer()
                    .frame(height: 10)
                Text("Historia wypożyczeń")
                List(viewModel.clientRentHistory, id: \.id) { history in
                    Text("\(history.car_model) - koszt: \(history.total_price_with_insurance)")
                }
            default:
                Text("cos poszlo nie tak")
            }
            
        }
        .onAppear{
            viewModel.loadInfo(id: id, dataType: dataType)
            viewModel.loadRentHistory(id: id, dataType: dataType)
        }
    }
    
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(dataType: "Client", id: 1)
    }
}
