//
//  DetailsView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import SwiftUI

struct DetailsView: View {
    
    @StateObject var viewModel = DetailsViewModel()
    let vehicle: String
    let vehicle_id: Int
    
    var body: some View {
        VStack {
            switch vehicle {
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
            default:
                Text("cos poszlo nie tak")
            }
            
        }
        .onAppear{
            viewModel.loadInfo(vehicle_id: vehicle_id, vehicle: vehicle)
            viewModel.loadRentHistory(vehicle_id: vehicle_id, vehicle: vehicle)
        }
    }
    
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(vehicle: "Motorcycle", vehicle_id: 2)
    }
}
