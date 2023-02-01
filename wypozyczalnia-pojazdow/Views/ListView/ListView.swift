//
//  ListView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 25/01/2023.
//

import SwiftUI

protocol ListViewRow {
    var id: Int { get }
    var title: String { get }
    var dataType: DataTypes { get }
}

struct ListView: View {
    
    @ObservedObject var viewModel: ListViewModel
    
    @State var showConfirmationAlert = false
    @State var showResultAlert = false
    @State var resultMessage = ""
    @State var idToDelete: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.dataType != .rent {
                    NavigationLink(destination: AddItemView(dataType: viewModel.dataType)) {
                        Label("", systemImage: "plus")
                    }
                    .frame(height: 30)
                    .frame(maxWidth: UIScreen.main.bounds.width - 40, alignment: .trailing)
                }
                HStack {
                    switch viewModel.dataType {
                    case .car:
                        Text("Samochody")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading, 30)
                            .padding(.bottom, -5)
                        Spacer()
                    case .motorcycle:
                        Text("Motocykle")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading, 30)
                            .padding(.bottom, -5)
                        Spacer()
                    case .utility:
                        Text("Ciężarówki")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading, 30)
                            .padding(.bottom, -5)
                        Spacer()
                    case .client:
                        Text("Klienci")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading, 30)
                            .padding(.bottom, -5)
                        Spacer()
                    case .rent:
                        Text("Wypożyczone")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading, 30)
                            .padding(.bottom, -5)
                        Spacer()
                    }
                }
                Form {
                    Section {
                        List($viewModel.dataRows, id: \.id) { item in
                            VStack(alignment: .leading) {
                                if viewModel.dataType == .rent {
                                    NavigationLink(destination: RentedView(dataType: item.wrappedValue.dataType, id: item.wrappedValue.id)) {
                                        Text(item.wrappedValue.title)
                                    }
                                } else {
                                    NavigationLink(destination: DetailsView(dataType: item.wrappedValue.dataType, id: item.wrappedValue.id)) {
                                        Text(item.wrappedValue.title)
                                            .swipeActions {
                                                if viewModel.dataType != .client {
                                                    Button("Usuń") {
                                                        showConfirmationAlert = true
                                                        idToDelete = item.wrappedValue.id
                                                    }
                                                    .tint(.red)
                                                }
                                            }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .onAppear() {
                viewModel.loadData()
            }
            .alert("Powiadomienie", isPresented: $showConfirmationAlert) {
                Button("Tak") {
                    Task {
                        resultMessage = await viewModel.deleteData(id: idToDelete, dataType: viewModel.dataType)
                        showResultAlert = true
                        viewModel.loadData()
                    }
                }
                Button("Nie") { }
            } message: {
                Text("Czy chcesz usunąć wybraną pozycję?")
            }
            .alert("Powiadomienie", isPresented: $showResultAlert) {}
        message: {
            Text(resultMessage)
        }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: ListViewModel(dataType: .rent))
    }
}
