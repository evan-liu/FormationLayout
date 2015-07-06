//
//  StackViewFormationTests.swift
//  FormationLayout
//
//  Created by Evan on 7/07/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class StackViewFormationTests: XCTestCase {
    var stack:StackViewType!
    
    var v1: UIView!
    var v2: UIView!
    var v3: UIView!
    var v4: UIView!
    var v5: UIView!
    
    var config: StackViewConfig!
    
    var formation: StackViewFormation!
    
    override func setUp() {
        stack = GroupStackView()
        
        v1 = UIView()
        v2 = UIView()
        v3 = UIView()
        v4 = UIView()
        v5 = UIView()
        
        config = StackViewConfig(axis: .Vertical, distribution: .EqualSpacing, alignment: .Center, spacing: 10, baselineRelativeArrangement: true, layoutMarginsRelativeArrangement: true)
        
        formation = StackViewFormation(stack: stack, config: config, arrangedSubviews: [v1, v2, v3])
    }
    
    // active setter
    func testActive() {
        // should no nothing if it is set to false
        formation.active = false
        XCTAssertEqual(stack.arrangedSubviews.count, 0)
        XCTAssertEqual(stack.currentConfig.spacing, 0)
        
        // should apply config and arrangedSubviews if it is set to true
        formation.active = true
        XCTAssertEqual(stack.arrangedSubviews.count, 3)
        XCTAssertEqual(stack.currentConfig.spacing, 10)
    }
    
    func testArrangedSubviews() {
        formation.active = true
        
        StackViewFormation(stack: stack, config: config, arrangedSubviews: [v5, v2, v4]).active = true
        
        XCTAssertEqual(stack.arrangedSubviews, [v5, v2, v4])
    }
    
    @available(iOS 9.0, *)
    func testArrangedSubviewsOfUIStackView() {
        let uiStack = UIStackView(arrangedSubviews: [v1, v2, v3])
        
        StackViewFormation(stack: uiStack, config: config, arrangedSubviews: [v5, v2, v4]).active = true
        
        XCTAssertEqual(uiStack.arrangedSubviews, [v5, v2, v4])
    }
}
