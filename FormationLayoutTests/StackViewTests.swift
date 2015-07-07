//
//  StackViewTests.swift
//  FormationLayout
//
//  Created by Evan on 7/07/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class StackViewTests: XCTestCase {

    // StackView()
    func testCreation() {
        
        let stack = StackView(arrangedSubviews: [UIView()], config: StackViewConfig(axis: .Vertical))

        // should return UIStackView in iOS 9 and UIView in iOS 8
        if #available(iOS 9.0, *) {
            XCTAssert(stack is UIStackView)
        } else {
            XCTAssert(stack is UIView)
        }
        
        // should pass views
        XCTAssertEqual(StackView().arrangedSubviews.count, 0)
        XCTAssertEqual(stack.arrangedSubviews.count, 1)
        
        // should apply config
        XCTAssertEqual(stack.currentConfig.axis, .Vertical)
        
    }

}
