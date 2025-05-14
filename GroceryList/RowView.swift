//
//  RowView.swift
//  GroceryList
//
//  Created by Hanna on 5/14/2025.
//


import SwiftUI

struct RowView: View {
    let item: GroceryItem

    var body: some View {
        Text(item.name)
    }
}
