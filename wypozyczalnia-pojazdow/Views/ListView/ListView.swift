//
//  ListView.swift
//  wypozyczalnia-pojazdow
//
//  Created by Piotr Waś on 25/01/2023.
//

import SwiftUI

protocol ListViewRow {
    var id: Int { get }
    var title: String { get }
    var dataType: DataTypes { get }
}

struct ListView: View {
    
    @Binding var rows: [DataListViewRow]
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddItemView()) {
                    Label("", systemImage: "plus")
                }
                    .frame(height: 30)
                    .frame(maxWidth: UIScreen.main.bounds.width - 40, alignment: .trailing)
                
                List(rows, id: \.id) { item in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: DetailsView(dataType: item.dataType, id: item.id)) {
                            Text(item.title)
                        }
                    }
                }
            }
        }
    }

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(rows: .constant([]))
    }
}
