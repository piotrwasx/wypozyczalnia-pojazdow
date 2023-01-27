//
//  ListView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 25/01/2023.
//

import SwiftUI

struct ListView: View {
    
    @State var dataType: String
    @ObservedObject var viewModel: ListViewModel

    init(dataType: String) {
        self.dataType = dataType
        self.viewModel = ListViewModel(dataType: dataType)
    }
    
    var body: some View {
        NavigationView {
            switch dataType {
            case "Car":
                List($viewModel.carTitles, id: \.id) { item in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: DetailsView(dataType: "Car", id: item.id.wrappedValue)) {
                            Text(item.car_model.wrappedValue)
                        }
                    }
                }
            case "Motorcycle":
                List($viewModel.motorcycleTitles, id: \.id) { item in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: DetailsView(dataType: "Motorcycle", id: item.id.wrappedValue)) {
                            Text(item.motorcycle_model.wrappedValue)
                        }
                    }
                }
            case "Utility":
                List($viewModel.utilityTitles, id: \.id) { item in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: DetailsView(dataType: "Utility", id: item.id.wrappedValue)) {
                            Text(item.utility_model.wrappedValue)
                        }
                    }
                }
            case "Client":
                List($viewModel.clientTitles, id: \.id) { item in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: DetailsView(dataType: "Client", id: item.id.wrappedValue)) {
                            Text(item.client_surname.wrappedValue)
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
        ListView(dataType: "CLient")
    }
}
