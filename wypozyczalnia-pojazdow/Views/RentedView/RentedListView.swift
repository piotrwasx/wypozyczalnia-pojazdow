//
//  RentedListView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 01/02/2023.
//

import SwiftUI

struct RentedListView: View {
    
    @ObservedObject var viewModel = RentedListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: NewRentForm()) {
                    Label("", systemImage: "plus")
                }
                .frame(height: 30)
                .frame(maxWidth: UIScreen.main.bounds.width - 40, alignment: .trailing)
                
                HStack {
                    Text("Wypożyczone")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.leading, 30)
                        .padding(.bottom, -5)
                    Spacer()
                }
                Form {
                    Section {
                        List($viewModel.rentedCarRows, id: \.id) { item in
                            VStack(alignment: .leading) {
                                NavigationLink(destination: RentedView(dataType: item.wrappedValue.dataType, id: item.wrappedValue.id)) {
                                    Text(item.wrappedValue.title)
                                }
                            }
                        }
                    } header: {
                        Text("Samochody")
                    }
                    Section {
                        List($viewModel.rentedUtilityRows, id: \.id) { item in
                            VStack(alignment: .leading) {
                                NavigationLink(destination: RentedView(dataType: item.wrappedValue.dataType, id: item.wrappedValue.id)) {
                                    Text(item.wrappedValue.title)
                                }
                            }
                        }
                    } header: {
                        Text("Ciężarówki")
                    }
                    Section {
                        List($viewModel.rentedMotorcycleRows, id: \.id) { item in
                            VStack(alignment: .leading) {
                                NavigationLink(destination: RentedView(dataType: item.wrappedValue.dataType, id: item.wrappedValue.id)) {
                                    Text(item.wrappedValue.title)
                                }
                            }
                        }
                    } header: {
                        Text("Motocykle")
                    }
                }
            }
            .onAppear() {
                viewModel.loadData()
            }
        }
    }
}

struct RentedListView_Previews: PreviewProvider {
    static var previews: some View {
        RentedListView()
    }
}
