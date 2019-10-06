//
//  RandomizableTests.swift
//  RandomizableTests
//
//  Created by Keegan Rush on 2017/09/29.
//  Copyright © 2017 thecodedself. All rights reserved.
//

import XCTest
@testable import Randomizable

class RandomizableTests: XCTestCase {
    
    func testRandomizedIntegersAreDifferent() {
        assertItemsAreRandom(Int.self)
    }

    func testRandomizedCGFloatsAreDifferent() {
        assertItemsAreRandom(CGFloat.self)
    }
    
    func testRandomizedStringsAreDifferent() {
        assertItemsAreRandom(String.self)
    }
    
    func testRandomizedColorsAreDifferent() {
        assertItemsAreRandom(UIColor.self)
    }
    
    func testRandomizedImagesAreDifferent() {
        assertItemsAreRandom(UIImage.self)
    }
    
    func assertItemsAreRandom<R: Randomizable>(_ randomizable: R.Type)
        where R.RandomElement: Equatable {
            for _ in 1...10 {
                XCTAssertNotEqual(randomizable.random, randomizable.random)
            }
    }
}
