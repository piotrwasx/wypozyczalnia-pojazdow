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
    
    var body: some View {
        VStack {
            Text("Client Details")
                .font(.title)
            
            TextField("Name", text: $client.client_name)
            TextField("Surname", text: $client.client_surname)
            TextField("Address", text: $client.client_address)
            TextField("City", text: $client.client_city)
            DatePicker("Please enter a date", selection: $selectedDate, displayedComponents: .date)
            Text("Selected date: \(selectedDate, formatter: dateFormatter)")
            
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
