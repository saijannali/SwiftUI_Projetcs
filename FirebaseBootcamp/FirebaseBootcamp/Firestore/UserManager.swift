//
//  UserManager.swift
//  FirebaseBootcamp
//
//  Created by Sai Jannali on 6/14/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

struct Movie: Codable {
    let id: String
    let tile: String
    let isPopular: Bool
}

struct DBUser: Codable {
    let userId: String
    let isAnonymous: Bool?
    let email: String?
    let photoUrl: String?
    let dateCreated: Date?
    let isPremium: Bool?
    let preferences: [String]?
    let favoriteMovie: Movie?
    let profileImgPath: String?
    
    init(auth: AuthDataResultModel) {
        self.userId = auth.uid
        self.isAnonymous = auth.isAnonymous
        self.email = auth.email
        self.photoUrl = auth.photoUrl
        self.dateCreated = Date()
        self.isPremium = false
        self.preferences = nil
        self.favoriteMovie = nil
        self.profileImgPath = nil
    }
    
    init(
        userId: String,
        isAnonymous: Bool? = nil,
        email: String? = nil,
        photoUrl: String? = nil,
        dateCreated: Date? = nil,
        isPremium: Bool? = nil,
        preferences: [String]? = nil,
        favoriteMovie: Movie? = nil,
        profileImgPath: String? = nil
    ) {
        self.userId = userId
        self.isAnonymous = isAnonymous
        self.email = email
        self.photoUrl = photoUrl
        self.dateCreated = dateCreated
        self.isPremium = isPremium
        self.preferences = preferences
        self.favoriteMovie = favoriteMovie
        self.profileImgPath = profileImgPath
    }
    
//    func togglePremiumStatus() -> DBUser{
//        let currentValue = isPremium ?? false
//        return DBUser(
//            userId: userId,
//            isAnonymous: isAnonymous,
//            email: email,
//            photoUrl: photoUrl,
//            dateCreated: dateCreated,
//            isPremium: !currentValue
//        )
//    }
    
//    mutating func togglePremiumStatus() {
//        let currentValue = isPremium ?? false
//        isPremium = !currentValue
//    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case isAnonymous = "is_anonymous"
        case email = "email"
        case photoUrl = "photo_url"
        case dateCreated = "date_created"
        case isPremium = "user_isPremium"
        case preferences = "preferences"
        case favoriteMovie = "favorite_movie"
        case profileImgPath = "prifle_image_path"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.isAnonymous = try container.decodeIfPresent(Bool.self, forKey: .isAnonymous)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.photoUrl = try container.decodeIfPresent(String.self, forKey: .photoUrl)
        self.dateCreated = try container.decodeIfPresent(Date.self, forKey: .dateCreated)
        self.isPremium = try container.decodeIfPresent(Bool.self, forKey: .isPremium)
        self.preferences = try container.decodeIfPresent([String].self, forKey: .preferences)
        self.favoriteMovie = try container.decodeIfPresent(Movie.self, forKey: .favoriteMovie)
        self.profileImgPath = try container.decode(String.self, forKey: .profileImgPath)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.isAnonymous, forKey: .isAnonymous)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.photoUrl, forKey: .photoUrl)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(self.isPremium, forKey: .isPremium)
        try container.encodeIfPresent(self.preferences, forKey: .preferences)
        try container.encodeIfPresent(self.profileImgPath, forKey: .profileImgPath)
    }
    
}

final class UserManager {
    
    static let shared = UserManager()
    private init() { }
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        return userCollection.document(userId)
    }
    
    private func userFavProductCollection(userId: String) -> CollectionReference {
        userDocument(userId: userId).collection("favorite_products")
    }
    
    private func userFavProductDocument(userId: String ,productId: String) -> DocumentReference {
        return userFavProductCollection(userId: userId).document(productId)
    }
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        //        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        //        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    private var favProductsListener: ListenerRegistration? = nil
    
    func createNewUser(user: DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false)
    }
    
    //    func createNewUser(auth: AuthDataResultModel) async throws {
    //        var userData: [String:Any] = [
    //            "user_id" : auth.uid,
    //            "is_anonymous" : auth.isAnonymous,
    //            "date_created" : Timestamp(),
    //        ]
    //        if let email = auth.email {
    //            userData["email"] = email
    //        }
    //        if let photoUrl = auth.photoUrl {
    //            userData["photo_url"] = photoUrl
    //        }
    //
    //        try await userDocument(userId: auth.uid).setData(userData, merge: false)
    //    }
    
    func getUser(userId: String) async throws -> DBUser {
        try await userDocument(userId: userId).getDocument(as: DBUser.self)
    }
    
    //    func getUser(userId: String) async throws -> DBUser {
    //        let snapshot = try await userDocument(userId: userId).getDocument()
    //
    //        guard let data = snapshot.data(), let userId = data["user_id"] as? String else {
    //            throw URLError(.badServerResponse)
    //        }
    //
    //        let isAnonymous = data["is_anonymous"] as? Bool
    //        let email = data["email"] as? String
    //        let photoUrl = data["photo_url"] as? String
    //        let dateCreated = data["data_created"] as? Date
    //
    //        return DBUser(userId: userId, isAnonymous: isAnonymous, email: email, photoUrl: photoUrl, dateCreated: dateCreated)
    //    }
    
    //    func updateUserPremiumStatus(user: DBUser) async throws {
    //        try userDocument(userId: user.userId).setData(from: user, merge: true, encoder: encoder)
    //    }
    
    func updateUserPremiumStatus(userId: String, isPremium: Bool) async throws {
        let data: [String: Any] = [
            DBUser.CodingKeys.isPremium.rawValue : isPremium
        ]
        
        try await userDocument(userId: userId).updateData(data)
    }
    
    func updateProfileImagePath(userId: String, path: String ) async throws {
        let data: [String: Any] = [
            DBUser.CodingKeys.profileImgPath.rawValue : path
        ]
        
        try await userDocument(userId: userId).updateData(data)
    }
    
    func addUserPreference(userId: String, preference: String) async throws {
        let data: [String: Any] = [
            DBUser.CodingKeys.preferences.rawValue : FieldValue.arrayUnion([preference])
        ]
        
        try await userDocument(userId: userId).updateData(data)
    }
    
    func removeUserPreference(userId: String, preference: String) async throws {
        let data: [String: Any] = [
            DBUser.CodingKeys.preferences.rawValue : FieldValue.arrayRemove([preference])
        ]
        
        try await userDocument(userId: userId).updateData(data)
    }
    
    func addFavoriteMovie(userId: String, movie: Movie) async throws {
        guard let data = try? encoder.encode(movie) else {
            throw URLError(.badURL)
        }
        
        let dict: [String:Any] = [
            DBUser.CodingKeys.favoriteMovie.rawValue : data
        ]
        
        try await userDocument(userId: userId).updateData(dict)
    }
    
    func removeFavoriteMovie(userId: String) async throws {
        let data: [String:Any?] = [
            DBUser.CodingKeys.favoriteMovie.rawValue : nil
        ]
        
        try await userDocument(userId: userId).updateData(data as [AnyHashable : Any])
    }
    
    func addFavoriteProduct(userId: String, productId: Int) async throws {
        let document = userFavProductCollection(userId: userId).document()
        let data: [String: Any] = [
            FavoriteProduct.CodingKeys.id.rawValue : document.documentID,
            FavoriteProduct.CodingKeys.productId.rawValue : productId,
            FavoriteProduct.CodingKeys.dateCreated.rawValue : Timestamp()
        ]
        try await document.setData(data, merge: false)
    }
    
    func removeFavoriteProduct(userId: String, productId: String) async throws {
        try await userFavProductDocument(userId: userId, productId: productId).delete()
    }
    
    func getAllFavProducts(userId: String) async throws -> [FavoriteProduct] {
        try await userFavProductCollection(userId: userId).getDocuments(as: FavoriteProduct.self)
    }
    
    func addListenerForAllUserFavoriteProducts(userId: String, completion: @escaping (_ products: [FavoriteProduct]) -> Void ) {
        self.favProductsListener = userFavProductCollection(userId: userId).addSnapshotListener { querySnap, error in
            guard let doc = querySnap?.documents else {
                print("No Docs")
                return
            }
            
            let products = doc.compactMap({ try? $0.data(as: FavoriteProduct.self) })
            completion(products)
            
            querySnap?.documentChanges.forEach({ diff in
                if (diff.type == .added) {
                    print("New products: \(diff.document.data())")
                }
                if (diff.type == .modified) {
                    print("Modified products: \(diff.document.data())")
                }
                if (diff.type == .removed) {
                    print("Removed products: \(diff.document.data())")
                }
            })
        }
    }
    
//    func addListenerForAllUserFavoriteProducts(userId: String ) -> AnyPublisher<[FavoriteProduct], Error> {
//        let publisher = PassthroughSubject<[FavoriteProduct], Error>()
//
//        self.favProductsListener = userFavProductCollection(userId: userId).addSnapshotListener { querySnap, error in
//            guard let doc = querySnap?.documents else {
//                print("No Docs")
//                return
//            }
//
//            let products = doc.compactMap({ try? $0.data(as: FavoriteProduct.self) })
//            publisher.send(products)
//        }
//        return publisher.eraseToAnyPublisher()
//    }
    func addListenerForAllUserFavoriteProducts(userId: String ) -> AnyPublisher<[FavoriteProduct], Error> {
        let (publisher, listener) = userFavProductCollection(userId: userId).addSnapshotListener(as: FavoriteProduct.self)
        self.favProductsListener = listener
        return publisher
    }
    
    
    
    func removeListenerForFavProducts() {
        self.favProductsListener?.remove()
    }

}

struct FavoriteProduct: Codable{
    let id: String
    let productId: Int
    let dateCreated: Date
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case productId = "product_id"
        case dateCreated = "date_created"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.productId, forKey: .productId)
        try container.encode(self.dateCreated, forKey: .dateCreated)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.productId = try container.decode(Int.self, forKey: .productId)
        self.dateCreated = try container.decode(Date.self, forKey: .dateCreated)
    }
}
