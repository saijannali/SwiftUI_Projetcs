//
//  MenuItem.swift
//  LittleLemon
//
//  Created by Sai Jannali on 10/4/23.
//

import Foundation


protocol MenuItemProtocol {
    var id: UUID { get }
    var priceDollar: Double { get }
    var title: String { get }
    var menuCategory: MenuCategory { get }
    var ordersCount: Int {get set}
    var priceCent: Int {get set}
    var ingredient: [Ingredient] {get set}
}

struct MenuItem: Identifiable, Hashable, MenuItemProtocol{
    let id: UUID
    let priceDollar: Double
    let title: String
    let menuCategory: MenuCategory
    var ordersCount: Int
    var priceCent: Int
    var ingredient: [Ingredient]

}
