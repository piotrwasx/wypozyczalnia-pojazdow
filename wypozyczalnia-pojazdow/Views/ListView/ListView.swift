//
//  ListView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 25/01/2023.
//

import SwiftUI

struct ListView: View {
    
    @State var dataType: DataTypes
    @ObservedObject var viewModel: ListViewModel

    init(dataType: DataTypes) {
        self.dataType = dataType
        self.viewModel = ListViewModel(dataType: dataType)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddItemView(dataType: dataType)) {
                    Label("", systemImage: "plus")
                }
                .frame(height: 30)
                .frame(maxWidth: UIScreen.main.bounds.width - 40, alignment: .trailing)
                
                switch dataType {
                case .car:
                    List($viewModel.carTitles, id: \.id) { item in
                        VStack(alignment: .leading) {
                            NavigationLink(destination: DetailsView(dataType: .car, id: item.id.wrappedValue)) {
                                Text(item.car_model.wrappedValue)
                            }
                        }
                    }
                case .motorcycle:
                    List($viewModel.motorcycleTitles, id: \.id) { item in
                        VStack(alignment: .leading) {
                            NavigationLink(destination: DetailsView(dataType: .motorcycle, id: item.id.wrappedValue)) {
                                Text(item.motorcycle_model.wrappedValue)
                            }
                        }
                    }
                case .utility:
                    List($viewModel.utilityTitles, id: \.id) { item in
                        VStack(alignment: .leading) {
                            NavigationLink(destination: DetailsView(dataType: .utility, id: item.id.wrappedValue)) {
                                Text(item.utility_model.wrappedValue)
                            }
                        }
                    }
                case .client:
                    List($viewModel.clientTitles, id: \.id) { item in
                        VStack(alignment: .leading) {
                            NavigationLink(destination: DetailsView(dataType: .client, id: item.id.wrappedValue)) {
                                Text(item.client_surname.wrappedValue)
                            }
                        }
                    }
                }
            }
        }
        .onAppear(perform: viewModel.loadData)
    }

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(dataType: .client)
    }
}
