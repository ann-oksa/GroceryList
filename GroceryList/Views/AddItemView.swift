//
//  AddItemView.swift
//  GroceryList
//
//  Created by Hanna on 5/13/2025.
//
import SwiftUI

struct AddItemView: View {
    
    @Environment(\.dismiss) var dismiss // dismiss view
    @State private var itemName: String = ""
    var onAdd: (GroceryItem) -> Void // Closure to send the new item back to parent view

    var body: some View {
        Form {
            TextField(Strings.itemName, text: $itemName)
                .autocorrectionDisabled(true)
            
            Button(Strings.add) {
                let newItem = GroceryItem(name: itemName)
                onAdd(newItem)
            }
            .disabled(itemName.trimmingCharacters(in: .whitespaces).isEmpty)
        }
        .navigationTitle(Strings.add)
    }
}
