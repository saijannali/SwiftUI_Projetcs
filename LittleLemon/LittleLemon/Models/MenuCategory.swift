//
//  MenuCategory.swift
//  LittleLemon
//
//  Created by Sai Jannali on 10/4/23.
//

import Foundation

enum MenuCategory: String, CaseIterable, Identifiable {
    var id: String { UUID().uuidString }
    case food = "Food"
    case drink = "Drink"
    case dessert = "Dessert"
}
