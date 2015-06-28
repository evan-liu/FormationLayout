//
//  View+UILayoutGuideTests.swift
//  FormationLayout
//
//  Created by Evan on 29/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class View_UILayoutGuideTests: XCTestCase {
    
    // isEqualTo()
    func testIsEqualTo() {
        let guide = LayoutGuide()
        
        // should return true for the same guide
        XCTAssertTrue(guide.isEqualTo(guide))
        
        // should return false for different guide
        XCTAssertFalse(guide.isEqualTo(LayoutGuide()))
        
        // should return false for different type
        if #available(iOS 9.0, *) {
            XCTAssertFalse(guide.isEqualTo(UIView()))
        }
    }

    // LayoutGuide()
    func testCreation() {
        // should return UILayoutGuide in iOS 9 and UIView in iOS 8
        
        let guide = LayoutGuide()
        
        if #available(iOS 9.0, *) {
            XCTAssert(guide is UILayoutGuide)
        } else {
            XCTAssert(guide is UIView)
        }
    }
    
    // LayoutGuide()
    func testContainer() {
        // should add to container
        
        let view = UIView()
        
        let guide = LayoutGuide(container: view)
        
        XCTAssert(guide.container!.isEqualTo(view))
        
    }
    
}