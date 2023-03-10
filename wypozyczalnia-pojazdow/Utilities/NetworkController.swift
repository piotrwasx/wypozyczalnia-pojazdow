//
//  NetworkController.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import Foundation

/// A structure to control a network request
struct NetworkController {
    /// fetching the data from database
    /// - Parameters:
    ///   - url: API url to send a GET request
    ///   - dataType: expected type of data
    static func fetchData<T: Codable>(url: String, dataType: T.Type, completion: @escaping ((T) -> Void)) {
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let data = data {
                    do {
                        let output = try JSONDecoder().decode(dataType.self, from: data)
                        completion(output)
                    } catch {
                        print("error: ", error)
                    }
                }
            }.resume()
        }
    }
    
    ///  A method to send the data into database
    /// - Parameters:
    ///   - url: API url to send a POST request
    ///   - dataToSend: expected type of data
    /// - Returns: returns status message
    static func sendData<T: Codable>(url: String, dataToSend: T) async -> String {
        if let url = URL(string: url) {
            guard let encoded = try? JSONEncoder().encode(dataToSend) else {
                return "Wprowadzono niepoprawne dane"
            }
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"

            do {
                _ = try await URLSession.shared.upload(for: request, from: encoded)
                return "Formularz został wysłany"
            } catch {
                return "Niepowodzenie"
            }
        }
        return "Wystąpił błąd połączenia"
    }
    
    /// A method to update the data into database
    /// - Parameters:
    ///   - url: API url to send a PUT request
    ///   - dataToSend: expected type of data
    /// - Returns: returns status message
    static func alterData<T: Codable>(url: String, dataToSend: T) async -> String {
        if let url = URL(string: url) {
            guard let encoded = try? JSONEncoder().encode(dataToSend) else {
                return "Wprowadzono niepoprawne dane"
            }
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "PUT"

            do {
                _ = try await URLSession.shared.upload(for: request, from: encoded)
                return "Formularz został wysłany"
            } catch {
                return "Niepowodzenie"
            }
        }
        return "Wystąpił błąd połączenia"
    }
    
    /// A method to change availability of an item, for example: when the car is not for rent anymore
    /// - Parameter url: API url to send a PUT request
    /// - Returns: returns status message
    static func changeAvailability(url: String) async -> String {
            if let url = URL(string: url) {
                var request = URLRequest(url: url)
                request.httpMethod = "PUT"

                URLSession.shared.dataTask(with: request) { data, response, error in
                    guard error == nil else {
                        print(error!)
                        return
                    }
                }.resume()
                return "Usunięto dane"
            } else {
                return "Błąd"
            }
        }
}

extension NetworkController {
    
    /// Fetch titles of specific data type from API
    /// - Parameter dataType: type of data to fetch
    /// - Returns: returns ''DataListViewRow'' type array
    func loadTitles(dataType: DataType) -> [DataListViewRow] {
        
        var dataRows: [DataListViewRow] = []
        
        switch dataType {
        case .car:
            dataRows = []
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/cars", dataType: [CarTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        dataRows.append(DataListViewRow(id: item.id, title: "\(item.car_brand) \(item.car_model)", dataType: .car))
                    }
                }}
        case .motorcycle:
            dataRows = []
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/motorcycles", dataType: [MotorcycleTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        dataRows.append(DataListViewRow(id: item.id, title: "\(item.motorcycle_brand) \(item.motorcycle_model)", dataType: .motorcycle))
                    }
                }}
        case .utility:
            dataRows = []
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/utilities", dataType: [UtilityTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        dataRows.append(DataListViewRow(id: item.id, title: "\(item.utility_brand) \(item.utility_model)", dataType: .utility))
                    }
                }}
        case .client:
            dataRows = []
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/clients", dataType: [ClientTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        dataRows.append(DataListViewRow(id: item.id, title: "\(item.client_name) \(item.client_surname)", dataType: .client))
                    }
                }}
        case .rent:
            dataRows = []
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/rented/cars", dataType: [CarTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        dataRows.append(DataListViewRow(id: item.id, title: "\(item.car_model) \(item.car_brand)", dataType: .car))
                    }
                }}
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/rented/motorcycles", dataType: [MotorcycleTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        dataRows.append(DataListViewRow(id: item.id, title: "\(item.motorcycle_model) \(item.motorcycle_brand)", dataType: .motorcycle))
                    }
                }}
            NetworkController.fetchData(url: "http://127.0.0.1:5000/api/rented/utilities", dataType: [UtilityTitle].self) { response in
                DispatchQueue.main.async {
                    for item in response {
                        dataRows.append(DataListViewRow(id: item.id, title: "\(item.utility_model) \(item.utility_brand)", dataType: .utility))
                    }
                }}
        }
        return dataRows
    }
}
