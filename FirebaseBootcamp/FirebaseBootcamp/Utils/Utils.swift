//
//  Utils.swift
//  FirebaseBootcamp
//
//  Created by Sai Jannali on 6/8/23.
//

import Foundation
import UIKit

final class Utilities {
    
    static let shared = Utilities()
    private init() {}
    
    @MainActor
    func topViewController(controller: UIViewController? = nil) -> UIViewController? {
        
        let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController
        
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        
        return controller
    }
}


//    func downloadAndUploadProducts() {
//        guard let url = URL(string: "https://dummyjson.com/products") else { return }
//
//        Task {
//            do {
//                let (data, _) = try await URLSession.shared.data(from: url)
//                let products = try JSONDecoder().decode(ProductsArray.self, from: data)
//                let productArray = products.products
//
//                for product in productArray {
//                    // try? used so no error handling
//                    try? await ProductsManager.shared.uploadProduct(product: product)
//                }
//                print("SUCCESS")
//                print(products.products.count)
//            } catch {
//                print("Error fetching")
//            }
//        }
//    }
