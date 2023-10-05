//
//  MenuItemsView.swift
//  LittleLemon
//
//  Created by Sai Jannali on 10/4/23.
//

import SwiftUI

struct MenuItemsView: View {
    
    @State var showOptionsView: Bool = false
    private var vm = MenuViewViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                // Food
                Section {
                    LazyVGrid(columns: columns) {
                        ForEach(vm.foodMenuItems) { item in
                            VStack {
                                NavigationLink(value: item) {
                                    Rectangle()
                                        .frame(height:100)
                                        .foregroundStyle(Color.black)
                                }
                                Text(item.title)
                            }
                        }
                    }
                } header: {
                    Text("Food")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                //Drinks
                Section {
                    LazyVGrid(columns: columns) {
                        ForEach(vm.drinkMenuItems) { item in
                            VStack{
                                Rectangle()
                                    .frame(height:100)
                                Text(item.title)
                            }
                            
                        }
                    }
                } header: {
                    Text("Drinks")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                //Dessert
                Section {
                    LazyVGrid(columns: columns) {
                        ForEach(vm.dessertMenuItems) { item in
                            VStack{
                                Rectangle()
                                    .frame(height:100)
                                Text(item.title)
                            }
                        }
                    }
                } header: {
                    Text("Dessert")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
            }
            .navigationDestination(for: MenuItem.self, destination: { item in
                MenuItemDetailsView(item: item)
            })
            .padding(.horizontal)
            .navigationTitle("Menu")
            .toolbar {
                Button {
                    print("show options view")
                    self.showOptionsView = true
                } label: {
                    Image(systemName: "slider.horizontal.3")
                }
            }
            .sheet(isPresented: $showOptionsView, content: {
                MenuItemsOptionView(showSheet: $showOptionsView)
            })
        }
    }
}

#Preview {
    MenuItemsView()
}
