//
//  LayoutGuideTests.swift
//  FormationLayout
//
//  Created by Evan on 29/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class LayoutGuideTests: XCTestCase {
    
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