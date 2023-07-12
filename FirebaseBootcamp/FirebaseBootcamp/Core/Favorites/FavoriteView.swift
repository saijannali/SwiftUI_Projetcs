//
//  FavoriteView.swift
//  FirebaseBootcamp
//
//  Created by Sai Jannali on 6/16/23.
//

import SwiftUI
import Combine

@MainActor
final class FavoriteViewModel: ObservableObject {
    
    @Published private(set) var favProducts: [FavoriteProduct] = []
    private var cancellables = Set<AnyCancellable>()
    
    func addListenerForFavorites() {
        guard let authDataResult = try? AuthenticationManager.shared.getAuthenticatedUser() else { return }
//        UserManager.shared.addListenerForAllUserFavoriteProducts(userId: authDataResult.uid) { [weak self] products in
//            self?.favProducts = products
//        }
        
        UserManager.shared.addListenerForAllUserFavoriteProducts(userId: authDataResult.uid)
            .sink { completion in
                
            } receiveValue: { [weak self] products in
                self?.favProducts = products
            }
            .store(in: &cancellables)

    }
    
//    func getFavorites() {
//        Task {
//            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
//            self.favProducts = try await UserManager.shared.getAllFavProducts(userId: authDataResult.uid)
//        }
//    }
    
    func removeFavorite(productId: String) {
        Task {
            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
            try? await UserManager.shared.removeFavoriteProduct(userId: authDataResult.uid, productId: productId)
            
        }
    }
    
    
    
}

struct FavoriteView: View {
    
    @StateObject private var viewModel = FavoriteViewModel()
    
    
    var body: some View {
        List {
            ForEach(viewModel.favProducts, id: \.id.self) { item in
                ProductCellViewBuilder(productId: String(item.productId))
                    .contextMenu {
                        Button("Remove as favorite") {
                            viewModel.removeFavorite(productId: item.id)
                        }
                    }
            }
        }
        .navigationTitle("Favorites")
        .onFirstAppear {
            viewModel.addListenerForFavorites()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FavoriteView()
        }
    }
}
