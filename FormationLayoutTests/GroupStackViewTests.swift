//
//  GroupStackViewTests.swift
//  FormationLayout
//
//  Created by Evan on 1/07/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class GroupStackViewTests: XCTestCase {
    var stack: GroupStackView!
    
    var v1: UIView!
    var v2: UIView!
    var v3: UIView!
    
    override func setUp() {
        stack = GroupStackView()
        v1 = UIView()
        v2 = UIView()
        v3 = UIView()
    }
    
    func testArrangedSubviews() {
        stack.arrangedSubviews = [v1, v2, v3]
        XCTAssertEqual(stack.arrangedSubviews, [v1, v2, v3])
    }
    
    // addArrangedSubview()
    func testAddArrangedSubview() {
        // should add view to arrangedSubviews
        
        stack.addArrangedSubview(v1)
        XCTAssertEqual(stack.arrangedSubviews, [v1])
        
        stack.addArrangedSubview(v2)
        XCTAssertEqual(stack.arrangedSubviews, [v1, v2])
        
        stack.addArrangedSubview(v3)
        XCTAssertEqual(stack.arrangedSubviews, [v1, v2, v3])

        // should ignore exist views
        
        stack.addArrangedSubview(v1)
        stack.addArrangedSubview(v2)
        stack.addArrangedSubview(v3)
        XCTAssertEqual(stack.arrangedSubviews, [v1, v2, v3])
    }
    
    // insertArrangedSubview()
    func testInsertArrangedSubview() {
        // should insert views to the index
        
        stack.insertArrangedSubview(v1, atIndex: 0)
        XCTAssertEqual(stack.arrangedSubviews, [v1])
        
        stack.insertArrangedSubview(v2, atIndex: 0)
        XCTAssertEqual(stack.arrangedSubviews, [v2, v1])
        
        stack.insertArrangedSubview(v3, atIndex: 1)
        XCTAssertEqual(stack.arrangedSubviews, [v2, v3, v1])

        stack.insertArrangedSubview(v1, atIndex: 1)
        stack.insertArrangedSubview(v2, atIndex: 1)
        stack.insertArrangedSubview(v3, atIndex: 1)
        XCTAssertEqual(stack.arrangedSubviews, [v2, v3, v1])
        
    }
    
    // removeArrangedSubview()
    func testRemoveArrangedSubview() {
        // should remove views from arrangedSubviews
        
        stack.arrangedSubviews = [v1, v2, v3]
        
        stack.removeArrangedSubview(v2)
        XCTAssertEqual(stack.arrangedSubviews, [v1, v3])
        
        stack.removeArrangedSubview(v1)
        stack.removeArrangedSubview(v2)        
        stack.removeArrangedSubview(v3)
        XCTAssertEqual(stack.arrangedSubviews, [])
    }
}