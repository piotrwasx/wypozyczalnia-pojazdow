//
//  ListView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 25/01/2023.
//

import SwiftUI

struct ListView: View {
    
    @State var vehicle: String
    @ObservedObject var viewModel: ListViewModel

    init(vehicle: String) {
        self.vehicle = vehicle
        self.viewModel = ListViewModel(vehicle: vehicle)
    }
    
    var body: some View {
        NavigationView {
            switch vehicle {
            case "Car":
                List($viewModel.carTitles, id: \.id) { item in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: DetailsView(vehicle: "Car", vehicle_id: item.id.wrappedValue)) {
                            Text(item.car_model.wrappedValue)
                        }
                    }
                }
            case "Motorcycle":
                List($viewModel.motorcycleTitles, id: \.id) { item in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: DetailsView(vehicle: "Motorcycle", vehicle_id: item.id.wrappedValue)) {
                            Text(item.motorcycle_model.wrappedValue)
                        }
                    }
                }
            case "Utility":
                List($viewModel.utilityTitles, id: \.id) { item in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: DetailsView(vehicle: "Utility", vehicle_id: item.id.wrappedValue)) {
                            Text(item.utility_model.wrappedValue)
                        }
                    }
                }
            default:
                Text("cos poszlo nie tak")
            }
            
        }
        .onAppear(perform: viewModel.loadData)
    }

}

struct CarsListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(vehicle: "Motorcycle")
    }
}
