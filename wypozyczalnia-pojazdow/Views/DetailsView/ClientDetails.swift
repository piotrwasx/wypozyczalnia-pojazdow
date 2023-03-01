//
//  ClientDetails.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 31/01/2023.
//

import SwiftUI

/// Detailed view of a specific ''Client''
struct ClientDetails: View {
    
    @State var client: Client
    @Binding var confirmationMessage: String
    @Binding var showingConfirmation: Bool
    
    @ObservedObject var viewModel = DetailsViewModel()
    
    var body: some View {
        List {
            Section {
                TextField("imię:", text: $client.client_name)
                    .font(.title)
                TextField("nazwisko:", text: $client.client_surname)
                    .font(.title)
            }
            Section{
                Text("id klienta: \($client.wrappedValue.id)")
                HStack {
                    Text("e-mail:")
                        .fontWeight(.semibold)
                    TextField("", text: $client.client_email ?? "")
                }
                HStack {
                    Text("adres:")
                        .fontWeight(.semibold)
                    TextField("", text: $client.client_address)
                }
                HStack {
                    Text("numer domu:")
                        .fontWeight(.semibold)
                    TextField("", text: $client.client_street_nr)
                }
                HStack {
                    Text("miasto:")
                        .fontWeight(.semibold)
                    TextField("", text: $client.client_city)
                }
                HStack {
                    Text("numer telefonu:")
                        .fontWeight(.semibold)
                    TextField("", text: $client.client_phone_nr)
                }
                HStack {
                    Text("data wydania prawa jazdy:")
                        .fontWeight(.semibold)
                    TextField("", text: $client.client_driving_license_since)
                }
            }
            Section {
                Button("Zapisz zmiany") {
                    if viewModel.update(client: client) {
                        confirmationMessage = "Zaktualizowano dane"
                    } else {
                        confirmationMessage = "Niepowodzenie"
                    }
                    showingConfirmation = true
                    hideKeyboard()
                }
            }
        }.onAppear() {
            guard client.client_driving_license_since != "" else { return
            }
            client.client_driving_license_since = client.client_driving_license_since.formatDateTime()
        }
    }
}

struct ClientDetails_Previews: PreviewProvider {
    static var previews: some View {
        ClientDetails(client: Client(), confirmationMessage: .constant(""), showingConfirmation: .constant(false))
    }
}

