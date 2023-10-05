//
//  TestTests.swift
//  TestTests
//
//  Created by Sai Jannali on 10/4/23.
//

import XCTest
@testable import Test

final class TestTests: XCTestCase {
    func test_calculateTotal_salesTaxTwentyPercent() {
        let items = [CheckoutItem(name: "Fish and Chips", price: 625),
                     CheckoutItem(name: "Fish", price: 325),
                     CheckoutItem(name: "Chips", price: 300),
                     CheckoutItem(name: "Fries", price: 300)
        ]
        let taxPercentage = 20
        let totalToPay = calculateTotal(items: item, localTaxPercent: taxPercentage)
        XCTAssertEqual(totalToPay, 2370)
        
    }

}
