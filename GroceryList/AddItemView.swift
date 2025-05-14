//
//  AddItemView.swift
//  GroceryList
//
//  Created by Hanna on 5/13/2025.
//
import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    @State private var itemName: String = ""
    var onAdd: (GroceryItem) -> Void

    var body: some View {
        Form {
            TextField("Item name", text: $itemName)

            Button("Add Item") {
                let newItem = GroceryItem(name: itemName)
                onAdd(newItem)
            }
            .disabled(itemName.trimmingCharacters(in: .whitespaces).isEmpty)
        }
        .navigationTitle("Add Item")
    }
}
