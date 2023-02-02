//
//  AddItemViewModel.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 28/01/2023.
//

import Foundation

final class AddItemViewModel: ObservableObject {
    
    @Published var confirmationMessage = ""
    @Published var showingConfirmation = false
    
    var urls = ["clients": "http://127.0.0.1:5000/api/clients/", "motorcycles": "http://127.0.0.1:5000/api/motorcycles/", "cars": "http://127.0.0.1:5000/api/cars/", "utilities": "http://127.0.0.1:5000/api/utilities/"]
    
    func processData(car: Car) -> Bool {
        if car.isCarDataValid() {
            Task {
                await postNewCar(url: urls["cars"]!, car: car)
            }
            return true
        }
        return false
    }
    
    func processData(motorcycle: Motorcycle) -> Bool {
        if motorcycle.isMotorcycleDataValid() {
            Task {
                await postNewMotorcycle(url: urls["motorcycles"]!, motorcycle: motorcycle)
            }
            return true
        }
        return false
    }
    
    func processData(utility: Utility) -> Bool {
        if utility.isUtilityDataValid() {
            Task {
                await postNewUtility(url: urls["utilities"]!, utility: utility)
            }
            return true
        }
        return false
    }
    
    func processData(client: Client) -> Bool {
        if client.isClientDataValid() {
            Task {
                await postNewClient(url: urls["clients"]!, client: client)
            }
            return true
        }
        return false
    }
    
    
    func postNewClient(url: String, client: Client) async {
        Task {
            confirmationMessage = await NetworkController.sendData(url: url, dataToSend: client)
            showingConfirmation = true
        }
    }
    
    func postNewMotorcycle(url: String, motorcycle: Motorcycle) async {
        Task {
            confirmationMessage = await NetworkController.sendData(url: url, dataToSend: motorcycle)
            showingConfirmation = true
        }
    }
    
    func postNewCar(url: String, car: Car) async {
        Task {
            confirmationMessage = await NetworkController.sendData(url: url, dataToSend: car)
            showingConfirmation = true
        }
    }
    
    func postNewUtility(url: String, utility: Utility) async {
        Task {
            confirmationMessage = await NetworkController.sendData(url: url, dataToSend: utility)
            showingConfirmation = true
        }
    }

}
