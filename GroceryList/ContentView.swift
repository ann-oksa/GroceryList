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
    
    var body: some View {
            NavigationView {
                VStack {
                    if groceryItems.isEmpty {
                        Text("No items")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
//                        List(groceryItems) { item in
//                            Text(item.name)
//                        }
                        List {
                            ForEach(groceryItems) { item in
                                Text(item.name)
                                    .onTapGesture {
                                        if let index = groceryItems.firstIndex(where: { $0.id == item.id }) {
                                            groceryItems.remove(at: index)
                                        }
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
            }
        }
}

#Preview {
    ContentView()
}
