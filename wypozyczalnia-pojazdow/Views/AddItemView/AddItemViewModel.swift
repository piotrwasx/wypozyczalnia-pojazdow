//
//  AddItemViewModel.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 28/01/2023.
//

import Foundation

/// A view model of forms to add new item into database
final class AddItemViewModel: ObservableObject {
    
    @Published var confirmationMessage = ""
    @Published var showingConfirmation = false
    
    /// An array of urls to fetch data of specific type
    var urls = ["clients": "http://127.0.0.1:5000/api/clients/", "motorcycles": "http://127.0.0.1:5000/api/motorcycles/", "cars": "http://127.0.0.1:5000/api/cars/", "utilities": "http://127.0.0.1:5000/api/utilities/"]
    
    /// This function validates the provided data and then sends it to database
    /// - Parameter data: an object of specific type that conforms to Codable, only handled data types are: ''Car'', ''Motorcycle'', ''Utility'' and ''Client''
    /// - Returns: returns true if data was validated successfully and send, returns false when the data doesn't pass validation process
    func validateAndSendData<T: Codable>(data: T) -> Bool {
        if let car = data as? Car {
            if car.isCarDataValid() {
                Task {
                    await sendNew(data: car)
                }
                return true
            }
        } else if let motorcycle = data as? Motorcycle {
            if motorcycle.isMotorcycleDataValid() {
                Task {
                    await sendNew(data: motorcycle)
                }
                return true
            }
        } else if let utility = data as? Utility {
            if utility.isUtilityDataValid() {
                Task {
                    await sendNew(data: utility)
                }
                return true
            }
        } else if let client = data as? Client {
            if client.isClientDataValid() {
                Task {
                    await sendNew(data: client)
                }
                return true
            }
        }
        return false
    }
    
    /// A method to send new object to the database'
    /// - Parameter data: an object of specific type that conforms to Codable, only handled data types are: ''Car'', ''Motorcycle'', ''Utility'' and ''Client''
    func sendNew<T: Codable>(data: T) async {
        if let car = data as? Car {
            Task {
                confirmationMessage = await NetworkController.sendData(url: urls["cars"]!, dataToSend: car)
                showingConfirmation = true
            }
        } else if let motorcycle = data as? Motorcycle {
            Task {
                confirmationMessage = await NetworkController.sendData(url: urls["motorcycles"]!, dataToSend: motorcycle)
                showingConfirmation = true
            }
        } else if let utility = data as? Utility {
            Task {
                confirmationMessage = await NetworkController.sendData(url: urls["utilities"]!, dataToSend: utility)
                showingConfirmation = true
            }
        } else if let client = data as? Client {
            Task {
                confirmationMessage = await NetworkController.sendData(url: urls["clients"]!, dataToSend: client)
                showingConfirmation = true
            }
        }
        
    }
}
