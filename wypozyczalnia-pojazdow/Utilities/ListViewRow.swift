//
//  Form.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 02/02/2023.
//

import Foundation

protocol ListViewRow {
    var id: Int { get }
    var title: String { get }
    var dataType: DataType { get }
}

struct DataListViewRow: ListViewRow {
    var id: Int
    var title: String
    var dataType: DataType
    
    func toString() -> String {
        return "\(id) - \((title))"
    }
}
