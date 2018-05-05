//
//  DMKTests.swift
//  DMKTests
//
//  Created by Brian Sy on 30/04/2018.
//  Copyright © 2018 dmk. All rights reserved.
//

import XCTest
@testable import DMK

class ClothingTests: XCTest {
    // MARK: Clothing Class Tests
    
    // Confirm that the Clothing Initializer returns an Clothing object when passed valid parameters
//    func clothingInitializationSucceeds() {
//        let noClassification = Clothing.init(brand: "Giordano", classification: 0, color: "blue", id: 123, material: "Cotton", status: 1, weather: 2, icon: nil)
//
//        XCTAssertNotNil(noClassification)
//    }
    
    // Confirm that the Clothing Initializer returns nil when passed negative int
//    func clothingInitializationFails() {
//        // Negative rating
//        let negativeStatus = Clothing.init(brand: "Giordano", classification: -1, color: "blue", id: 123, material: "Cotton", status: 1, weather: -1, icon: nil)
//
//        XCTAssertNotNil(negativeStatus)
//
//        // Empty string
//        let emptyBrand = Clothing.init(brand: "", classification: 1, color: "blue", id: 123, material: "Cotton", status: 1, weather: 1, icon: nil)
//        XCTAssertNotNil(emptyBrand)
//    }
    
}

class DMKTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
