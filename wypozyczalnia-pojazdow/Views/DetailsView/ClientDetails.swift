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
                TextField("e-mail", text: $client.client_email ?? "")
                TextField("adres:", text: $client.client_address)
                TextField("adres:", text: $client.client_street_nr)
                TextField("miasto:", text: $client.client_city)
                TextField("numer telefonu:", text: $client.client_phone_nr)
                TextField("data wydania prawa jazdy:", text: $client.client_driving_license_since)
            }
            Section {
                Button("Zapisz zmiany") {
                    if viewModel.update(client: client) {
                        confirmationMessage = "Zaktualizowano dane"
                        showingConfirmation = true
                    } else {
                        confirmationMessage = "Niepowodzenie"
                        showingConfirmation = true
                    }
                }
            }
        }.onAppear() {
            guard client.client_driving_license_since != "" else { return }
            client.client_driving_license_since = client.client_driving_license_since.formatDateTime()
        }
    }
}

struct ClientDetails_Previews: PreviewProvider {
    static var previews: some View {
        ClientDetails(client: Client(), confirmationMessage: .constant(""), showingConfirmation: .constant(false))
    }
}

