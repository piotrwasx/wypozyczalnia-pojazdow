//
//  AddItemViewModel.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 28/01/2023.
//

import Foundation

final class AddItemViewModel: ObservableObject {
    let url = "http://127.0.0.1:5000/api/clients/"
    
    func postNewClient(client: Client) async {
        await NetworkController.sendData(url: url, dataToSend: client)
    }
}
