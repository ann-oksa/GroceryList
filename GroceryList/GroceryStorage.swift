//
//  GroceryStorage.swift
//  GroceryList
//
//  Created by Hanna on 5/14/2025.
//

import Foundation

struct GroceryStorage {
    private static let groceryListKey = "groceryItemsKey"

    static func save(_ items: [GroceryItem]) {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: groceryListKey)
        }
    }

    static func load() -> [GroceryItem] {
        if let data = UserDefaults.standard.data(forKey: groceryListKey),
           let decoded = try? JSONDecoder().decode([GroceryItem].self, from: data) {
            return decoded
        }
        return []
    }
}
