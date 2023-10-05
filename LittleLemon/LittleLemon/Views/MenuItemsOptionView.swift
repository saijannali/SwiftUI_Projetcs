//
//  MenuItemsOptionView.swift
//  LittleLemon
//
//  Created by Sai Jannali on 10/4/23.
//

import SwiftUI


enum SortOptions: String, CaseIterable, Identifiable {
    var id: String { UUID().uuidString }
    case popular = "Most Popular"
    case price = "Price $-$$$"
    case alphabet = "A-Z"
}



struct MenuItemsOptionView: View {
    @Binding var showSheet: Bool
    
    var body: some View {
        List{
            //Done Button
            HStack {
                Spacer()
                Button("Done") {
                    self.showSheet = false
                }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color(UIColor.secondarySystemBackground))
            
            //Title: Filter
            HStack{
                Text("Filter")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Spacer()
            }
            .listRowInsets(.none)
            .listRowBackground(Color(UIColor.secondarySystemBackground))
            
            Section {
                ForEach(MenuCategory.allCases) { category in
                    Text(category.rawValue)
                }
            } header: {
                Text("Selected Categories")
            }
            
            Section {
                ForEach(SortOptions.allCases) { option in
                    Text(option.rawValue)
                }
            } header: {
                Text("Sort By")
            }
        
        }
    }
}

#Preview {
    MenuItemsOptionView(showSheet: .constant(true))
}
