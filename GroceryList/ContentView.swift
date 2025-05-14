//
//  ContentView.swift
//  GroceryList
//
//  Created by Hanna on 5/13/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var groceryItems: [GroceryItem] = []
    @State private var isNavigatingToAddItem = false
    @State private var itemToDelete: GroceryItem? = nil
    @State private var showDeleteAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                if groceryItems.isEmpty {
                    Text("No items")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(groceryItems) { item in
                            RowView(item: item)
                                .onTapGesture {
                                    itemToDelete = item
                                    showDeleteAlert = true
                                }
                        }
                    }
                }
                NavigationLink(
                    destination: AddItemView { newItem in
                        groceryItems.append(newItem)
                        isNavigatingToAddItem = false
                    },
                    isActive: $isNavigatingToAddItem
                ) {
                    EmptyView()
                }
            }
            .navigationTitle("Grocery List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isNavigatingToAddItem = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert("Are you sure you want to remove this item?", isPresented: $showDeleteAlert, presenting: itemToDelete) { item in
                Button("Delete", role: .destructive) {
                    if let index = groceryItems.firstIndex(of: item) {
                        groceryItems.remove(at: index)
                    }
                }
                Button("Cancel", role: .cancel) {}
            }
        }
    }
}

#Preview {
    ContentView()
}
