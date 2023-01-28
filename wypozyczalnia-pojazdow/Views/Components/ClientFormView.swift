//
//  ClientFormView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 28/01/2023.
//

import SwiftUI

struct ClientFormView: View {
    
    @Binding var showingConfirmation: Bool
    @Binding var confirmationMessage: String
    
    @State private var client = Client()
    @State private var selectedDate = Date()
    @State private var email: String = ""
    
    var body: some View {
        VStack {
            Text("Dodaj nowego klienta")
                .font(.title)
            TextField("Imię *", text: $client.client_name)
            TextField("Nazwisko *", text: $client.client_surname)
            TextField("Adres *", text: $client.client_address)
            TextField("Miasto *", text: $client.client_city)
            TextField("Numer telefonu *", text: $client.client_phone_nr)
            TextField("e-mail", text: $email)
            DatePicker("Data wydania prawa jazdy:", selection: $selectedDate, displayedComponents: .date)
            
            Button("Zatwierdź dane") {
                client.client_email = email
                client.client_driving_license_since = dateFormatter.string(from: $selectedDate.wrappedValue)
                Task {
                    confirmationMessage = await NetworkController.sendData(url: "http://127.0.0.1:5000/api/clients/", dataToSend: client)
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
