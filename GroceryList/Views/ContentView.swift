//
//  ContentView.swift
//  GroceryList
//
//  Created by Hanna on 5/13/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var groceryItems: [GroceryItem] = []
    @State private var isNavigatingToAddItem = false // check if navigation is active
    @State private var itemToDelete: GroceryItem? = nil
    @State private var showDeleteAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                if groceryItems.isEmpty {
                    Text(Strings.noItems)
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
                        GroceryStorage.save(groceryItems)
                        isNavigatingToAddItem = false
                    },
                    isActive: $isNavigatingToAddItem
                ) {
                    EmptyView()
                }
            }
            .navigationTitle(Strings.groceryListTitle)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) { //toolbar right button
                    Button(action: {
                        isNavigatingToAddItem = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert(Strings.deleteConfirmationTitle, isPresented: $showDeleteAlert, presenting: itemToDelete) { item in
                Button(Strings.delete, role: .destructive) {
                    if let index = groceryItems.firstIndex(of: item) {
                        groceryItems.remove(at: index)
                        GroceryStorage.save(groceryItems)
                    }
                }
                Button(Strings.cancel, role: .cancel) {}
            }
            .onAppear {
                groceryItems = GroceryStorage.load()
            }
        }
    }
}

#Preview {
    ContentView()
}
