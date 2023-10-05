//
//  MenuItemDetailsView.swift
//  LittleLemon
//
//  Created by Sai Jannali on 10/4/23.
//

import SwiftUI

struct MenuItemDetailsView: View {
    
    let item: MenuItem
    
    init(item: MenuItem) {
        self.item = item
    }
    
    var body: some View {
        
        VStack {
            Text(item.title)
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                
            
            //image
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(height:400)
                
            VStack {
                Text("Price:")
                    .bold()
                Text("\(String(format: "%.2f", item.priceDollar))")
            }
            VStack {
                Text("Ordered:")
                    .bold()
                Text("\(item.ordersCount)")
            }
            VStack {
                Text("Ingredients: ")
                    .bold()
                ForEach(item.ingredient.indices) { idx in
                    Text(item.ingredient[idx].rawValue)
                }
            }
        }
        .padding()
    }
}

#Preview {
    MenuItemDetailsView(item: MenuItem(id: UUID(), priceDollar: 1.0, title: "title", menuCategory: .drink, ordersCount: 1, priceCent: 100, ingredient: [.spinach, .tomatoSauce]))
}
