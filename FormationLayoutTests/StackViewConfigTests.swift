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
        
        c1.stackDistribution = .EqualCentering
        XCTAssert(c1 != c2)
        c2.stackDistribution = .EqualCentering
        XCTAssert(c1 == c2)
        
        c1.stackAlignment = .LastBaseline
        XCTAssert(c1 != c2)
        c2.stackAlignment = .LastBaseline
        XCTAssert(c1 == c2)
    }
    
}
