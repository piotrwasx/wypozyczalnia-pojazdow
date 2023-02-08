//
//  ClientFormView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 28/01/2023.
//

import SwiftUI

/// A form to add a new ''Client''
struct ClientFormView: View {
    
    @Binding var showingConfirmation: Bool
    @Binding var confirmationMessage: String
    
    @ObservedObject var viewModel = AddItemViewModel()
    @State private var client = Client()
    @State private var selectedDate = Date()
    @State private var email: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    Text("Dodaj nowego klienta")
                        .font(.title)
                }
                Section {
                    TextField("Imię *", text: $client.client_name)
                    TextField("Nazwisko *", text: $client.client_surname)
                    TextField("Adres *", text: $client.client_address)
                    TextField("Numer ulicy *", text: $client.client_street_nr)
                    TextField("Miasto *", text: $client.client_city)
                    TextField("Numer telefonu *", text: $client.client_phone_nr)
                    TextField("e-mail", text: $email)
                } header: {
                    Text("dane")
                }
                Section {
                    DatePicker("Data wydania prawa jazdy:", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                } header: {
                    Text("data wydania prawa jazdy")
                }
                Button("Zatwierdź dane") {
                    client.client_driving_license_since = dateFormatter.string(from: $selectedDate.wrappedValue)
                    client.client_email = $email.wrappedValue
                    if viewModel.validateAndSendData(data: client) {
                        confirmationMessage = "Dodano nowego klienta"
                    } else {
                        confirmationMessage = "Niepowodzenie"
                    }
                    showingConfirmation = true
                }
            }
        }
    }
}

struct ClientFormView_Previews: PreviewProvider {
    static var previews: some View {
        ClientFormView(showingConfirmation: .constant(false), confirmationMessage: .constant(""))
    }
}
