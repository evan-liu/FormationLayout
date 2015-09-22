//
//  StackViewConfigTests.swift
//  FormationLayout
//
//  Created by Evan on 1/07/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class StackViewConfigTests: XCTestCase {
    
    // init()
    func testInit() {
        // should set default values
        let c1 = StackViewConfig()
        XCTAssertEqual(c1.distribution, StackViewDistribution.Fill)
        XCTAssertEqual(c1.alignment, StackViewAlignment.Fill)
        XCTAssertEqual(c1.spacing, 0)
        XCTAssertEqual(c1.baselineRelativeArrangement, false)
        XCTAssertEqual(c1.layoutMarginsRelativeArrangement, false)
        
        // should set by arguments
        let c2 = StackViewConfig(axis: .Vertical, distribution: .EqualSpacing, alignment: .Center, spacing: 10, baselineRelativeArrangement: true, layoutMarginsRelativeArrangement: true)
        XCTAssertEqual(c2.distribution, StackViewDistribution.EqualSpacing)
        XCTAssertEqual(c2.alignment, StackViewAlignment.Center)
        XCTAssertEqual(c2.spacing, 10)
        XCTAssertEqual(c2.baselineRelativeArrangement, true)
        XCTAssertEqual(c2.layoutMarginsRelativeArrangement, true)
    }

    func testEquatable() {
        var c1 = StackViewConfig()
        var c2 = StackViewConfig()
        
        XCTAssert(c1 == c2)
        
        c1.spacing = 10
        XCTAssert(c1 != c2)
        c2.spacing = 10
        XCTAssert(c1 == c2)
        
        c1.baselineRelativeArrangement = true
        XCTAssert(c1 != c2)
        c2.baselineRelativeArrangement = true
        XCTAssert(c1 == c2)
        
        c1.layoutMarginsRelativeArrangement = true
        XCTAssert(c1 != c2)
        c2.layoutMarginsRelativeArrangement = true
        XCTAssert(c1 == c2)
        
        c1.axis = .Vertical
        XCTAssert(c1 != c2)
        c2.axis = .Vertical
        XCTAssert(c1 == c2)
        
        c1.distribution = .EqualCentering
        XCTAssert(c1 != c2)
        c2.distribution = .EqualCentering
        XCTAssert(c1 == c2)
        
        c1.alignment = .LastBaseline
        XCTAssert(c1 != c2)
        c2.alignment = .LastBaseline
        XCTAssert(c1 == c2)
    }
    
    // StackViewAlignment
    func testStackViewAlignment() {
        // .Top and .Bottom should return .Leading and .Trailing
        XCTAssertEqual(StackViewAlignment.Top, StackViewAlignment.Leading)
        XCTAssertEqual(StackViewAlignment.Bottom, StackViewAlignment.Trailing)
    }
    
}
