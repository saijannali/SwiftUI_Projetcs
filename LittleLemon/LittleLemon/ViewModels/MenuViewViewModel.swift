//
//  MenuViewViewModel.swift
//  LittleLemon
//
//  Created by Sai Jannali on 10/4/23.
//

import Foundation


class MenuViewViewModel{
    var foodMenuItems: [MenuItem] = []
    
    var drinkMenuItems: [MenuItem] = []
    var dessertMenuItems: [MenuItem] = []
    
    init() {
        self.loadFoodItems()
        self.loadDrinkItems()
        self.loadDessertItems()
    }
    
    func loadFoodItems() {
        var items: [MenuItem] = []
        
        for i in 1..<13 {
            let dollarPrice = Double.random(in: 1.0..<5.00)
            let centPrice = Int(dollarPrice * 100)
            let ordersCount = Int.random(in: 1..<4)
            let item = MenuItem(id: UUID(), priceDollar: dollarPrice, title: "Food \(i)", menuCategory: .food, ordersCount: ordersCount , priceCent: centPrice, ingredient: [.broccoli, .carrot, .pasta, .spinach, .tomatoSauce])
            items.append(item)
        }
        self.foodMenuItems = items
    }
    
    func loadDrinkItems() {
        var items: [MenuItem] = []
        
        for i in 1..<9{
            let dollarPrice = Double.random(in: 1.0..<5.00)
            let centPrice = Int(dollarPrice * 100)
            let ordersCount = Int.random(in: 1..<4)
            let item = MenuItem(id: UUID(), priceDollar: dollarPrice, title: "Drink \(i)", menuCategory: .drink, ordersCount: ordersCount , priceCent: centPrice, ingredient: [.broccoli, .carrot, .pasta, .spinach, .tomatoSauce])
            items.append(item)
        }
        self.drinkMenuItems = items
        
    }
    
    func loadDessertItems() {
        var items: [MenuItem] = []
        
        for i in 1..<5 {
            let dollarPrice = Double.random(in: 1.0..<5.00)
            let centPrice = Int(dollarPrice * 100)
            let ordersCount = Int.random(in: 1..<4)
            let item = MenuItem(id: UUID(), priceDollar: dollarPrice, title: "Dessert \(i)", menuCategory: .food, ordersCount: ordersCount , priceCent: centPrice, ingredient: [.broccoli, .carrot, .pasta, .spinach, .tomatoSauce])
            items.append(item)
        }
        self.dessertMenuItems = items
    }
}





