//
//  AddItemView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 27/01/2023.
//

import SwiftUI

struct AddItemView: View {
    
    @State var client = Client()
    @State private var selectedDate = Date()
    @State private var email: String = ""
    
    @StateObject private var viewModel = AddItemViewModel()
    
    var body: some View {
        VStack {
            Text("Dodaj nowego klienta")
                .font(.title)
            Group {
                TextField("Imię *", text: $client.client_name)
                TextField("Nazwisko *", text: $client.client_surname)
                TextField("Adres *", text: $client.client_address)
                TextField("Miasto *", text: $client.client_city)
                TextField("Numer telefonu *", text: $client.client_phone_nr)
                TextField("e-mail", text: $email)
                DatePicker("Data wydania prawa jazdy:", selection: $selectedDate, displayedComponents: .date)
            }
            
            Button("Zatwierdź dane") {
                client.client_email = email
                client.client_driving_license_since = dateFormatter.string(from: $selectedDate.wrappedValue)
                Task {
                    await viewModel.postNewClient(client: $client.wrappedValue)
                }
            }
        }
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
