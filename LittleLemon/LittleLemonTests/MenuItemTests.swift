//
//  MenuItemTests.swift
//  LittleLemonTests
//
//  Created by Sai Jannali on 10/4/23.
//

import XCTest

@testable import LittleLemon

final class MenuItemTests: XCTestCase {
    
    func testMenuItemTitleDuringInit() {
        let title = "Lemon"
        let item = MenuItem(id: UUID(), priceDollar: 10.0, title: title, menuCategory: .food, ordersCount: 1, priceCent: 1000, ingredient: [.carrot])
        XCTAssertEqual(item.title, title)
    }
    
    func testMenuItemIngredientsDuringInit() {
        let ingredients: [Ingredient] = [.broccoli, .carrot]
        let item = MenuItem(id: UUID(), priceDollar: 10.0, title: "Lemon", menuCategory: .food, ordersCount: 1, priceCent: 1000, ingredient: ingredients)
        XCTAssertEqual(item.ingredient, ingredients)
        
    }
}
