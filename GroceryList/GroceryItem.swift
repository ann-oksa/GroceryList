//
//  Untitled.swift
//  GroceryList
//
//  Created by Hanna on 5/13/2025.
//
import Foundation

struct GroceryItem: Identifiable, Equatable, Codable {
    let id: UUID
    let name: String

    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
