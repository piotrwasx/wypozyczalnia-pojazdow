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
}
