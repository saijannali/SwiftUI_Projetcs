//
//  ProductsViewModel.swift
//  FirebaseBootcamp
//
//  Created by Sai Jannali on 6/17/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ProductsArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

struct Product: Identifiable, Codable {
    let id: Int
    let title: String?
    let description: String?
    let price: Int?
    let discountPercentage: Double?
    let rating: Double?
    let stock: Int?
    let brand, category: String?
    let thumbnail: String?
    let images: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case price
        case discountPercentage
        case rating
        case stock
        case brand
        case category
        case thumbnail
        case images
    }
}

@MainActor
final class ProductsViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var selectedFilter: FilterOption? = nil
    @Published var selectedCategory: CategoryOption? = nil
    private var lastDocument: DocumentSnapshot? = nil
    
    enum FilterOption: String, CaseIterable {
        case noFilter
        case priceHigh
        case priceLow
        
        var priceDecending: Bool? {
            switch self {
            case .noFilter: return nil
            case .priceLow: return false
            case .priceHigh: return true
            }
        }
    }
    
    func filterSelected(option: FilterOption) async throws {
        self.selectedFilter = option
        getProducts()
    }
    
    enum CategoryOption: String, CaseIterable {
        case noCategory
        case smartphones
        case laptops
        case fragrances
        
        var categoryKey: String? {
            if self == .noCategory {
                return nil
            }
            return self.rawValue
        }
    }
    
    func categorySelected(option: CategoryOption) async throws {
        self.selectedCategory = option
        self.getProducts()
    }
    
    func getProducts() {
        Task {
            self.products = try await ProductsManager.shared.getAllProducts(priceDescending: selectedFilter?.priceDecending, forCategory: selectedCategory?.categoryKey)
        }
    }
    
    func addFavProduct(productId: Int) {
        Task {
            let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
            try? await UserManager.shared.addFavoriteProduct(userId: authDataResult.uid, productId: productId)
        }
    }
    
//    func getProductsByRating() {
//        Task {
//            let (newProducts, lastDocument) = try await ProductsManager.shared.getProductsByRating(count: 3, lastDocument: self.lastDocument)
//            self.lastDocument = lastDocument
//            self.products.append(contentsOf: newProducts)
//        }
//    }
    
}
