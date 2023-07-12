//
//  ProductsManager.swift
//  FirebaseBootcamp
//
//  Created by Sai Jannali on 6/15/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class ProductsManager {
    static let shared = ProductsManager()
    private init() { }
    
    private let productsCollection = Firestore.firestore().collection("products")
    
    private func productDocument(productId: String) -> DocumentReference {
        productsCollection.document(productId)
    }
    
    func uploadProduct(product: Product) async throws {
        try productDocument(productId: String(product.id)).setData(from: product, merge: false)
    }
    
    func getProduct(productId: String) async throws -> Product{
        try await productDocument(productId: productId).getDocument(as: Product.self)
    }
    
    func getAllProducts(priceDescending decending: Bool?, forCategory category: String?) async throws -> [Product] {
        var query: Query = getAllProductsQuery()
        
        if let decending, let category {
            query =  getAllProductsByPriceAndCategoryQuery(descending: decending, category: category)
        } else if let decending {
            query = getAllProductsSortedByPriceQuery(decending: decending)
        } else if let category {
            query = getAllProductsByCategoryQuery(category: category)
        }
        return try await query
            .getDocuments(as: Product.self)
    }
    
    private func getAllProductsQuery() -> Query {
        productsCollection
    }
    
    private func getAllProductsSortedByPriceQuery(decending: Bool) -> Query {
        productsCollection
            .order(by: Product.CodingKeys.price.rawValue, descending: decending)
    }
    
    private func getAllProductsByCategoryQuery(category: String) -> Query {
        productsCollection
            .whereField(Product.CodingKeys.category.rawValue, isEqualTo: category)
    }
    
    private func getAllProductsByPriceAndCategoryQuery(descending: Bool, category: String)-> Query {
        productsCollection
            .whereField(Product.CodingKeys.category.rawValue, isEqualTo: category)
            .order(by: Product.CodingKeys.category.rawValue, descending: descending)
    }
    //    private func getAllProducts() async throws -> [Product] {
    //        try await productsCollection
    //            .getDocuments(as: Product.self)
    //    }
    //
    //    private func getAllProductsSortedByPrice(decending: Bool) async throws -> [Product] {
    //        try await productsCollection.order(by: Product.CodingKeys.price.rawValue, descending: decending).getDocuments(as: Product.self)
    //    }
    //
    //    private func getAllProductsByCategory(category: String) async throws -> [Product] {
    //        try await productsCollection.whereField( Product.CodingKeys.category.rawValue, isEqualTo: category).getDocuments(as: Product.self)
    //    }
    //
    //    private func getAllProductsByPriceAndCategory(descending: Bool, category: String) async throws -> [Product] {
    //        try await productsCollection
    //            .whereField( Product.CodingKeys.category.rawValue, isEqualTo: category)
    //            .order(by: Product.CodingKeys.price.rawValue, descending: descending)
    //            .getDocuments(as: Product.self)
    //    }
        
    //    func getProductsByRating(count: Int, lastRating: Double?) async throws -> [Product]{
    //        try await productsCollection
    //            .order(by: Product.CodingKeys.rating.rawValue, descending: true)
    //            .limit(to: count)
    //            .start(after: [lastRating ?? 9999999])
    //            .getDocuments(as: Product.self)
    //    }
    //
    
    func getProductsByRating(count: Int, lastDocument: DocumentSnapshot?) async throws -> (products: [Product], lastDocument: DocumentSnapshot?){
        if let lastDocument {
            return try await productsCollection
                .order(by: Product.CodingKeys.rating.rawValue, descending: true)
                .limit(to: count)
                .start(afterDocument: lastDocument)
                .getDocumentsWithSnapshot(as: Product.self)
        } else {
            return try await productsCollection
                .order(by: Product.CodingKeys.rating.rawValue, descending: true)
                .limit(to: count)
                .getDocumentsWithSnapshot(as: Product.self)
        }

    }
    
}

