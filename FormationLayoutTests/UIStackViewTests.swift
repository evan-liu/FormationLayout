//
//  UIStackViewTests.swift
//  FormationLayout
//
//  Created by Evan on 30/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

@available(iOS 9.0, *)
class UIStackViewTests: XCTestCase {

    func testAlignment() {
        let stack = UIStackView()
        
        XCTAssertEqual(stack.stackAlignment, .Fill)
        
        stack.stackAlignment = .Center
        XCTAssertEqual(stack.stackAlignment, .Center)
        
        stack.stackAlignment = .Leading
        XCTAssertEqual(stack.stackAlignment, .Leading)
        
        stack.stackAlignment = .Trailing
        XCTAssertEqual(stack.stackAlignment, .Trailing)
        
        stack.stackAlignment = .FirstBaseline
        XCTAssertEqual(stack.stackAlignment, .FirstBaseline)
        
        stack.stackAlignment = .LastBaseline
        XCTAssertEqual(stack.stackAlignment, .LastBaseline)
        
        stack.stackAlignment = .Fill
        XCTAssertEqual(stack.stackAlignment, .Fill)
    }
    
    func testDistribution() {
        let stack = UIStackView()
        
        XCTAssertEqual(stack.stackDistribution, .Fill)
        
        stack.stackDistribution = .FillEqually
        XCTAssertEqual(stack.stackDistribution, .FillEqually)

        stack.stackDistribution = .FillProportionally
        XCTAssertEqual(stack.stackDistribution, .FillProportionally)
        
        stack.stackDistribution = .EqualSpacing
        XCTAssertEqual(stack.stackDistribution, .EqualSpacing)
        
        stack.stackDistribution = .EqualCentering
        XCTAssertEqual(stack.stackDistribution, .EqualCentering)
        
        stack.stackDistribution = .Fill
        XCTAssertEqual(stack.stackDistribution, .Fill)
    }
    
}
