//
//  NetworkController.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 26/01/2023.
//

import Foundation

struct NetworkController {
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
        
}
