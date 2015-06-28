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

    // addToContainer()
    @available(iOS 9.0, *)
    func testAddToContainer() {
        let guide = LayoutGuide()
        
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()
        
        do { // when the guide is first created
            do { // it should has no container
                XCTAssert(guide.container == nil)
            }
        }
        
        do { // when the view has no container
            do { // it should add the view to container
                guide.addToContainer(view1, forceMove: false)
                XCTAssert(guide.container!.isEqualTo(view1))
                XCTAssertEqual(view1.layoutGuides.count, 1)
            }
            
            do { // when the view has contianer
                do { // when forceMove is false
                    do { // it should not move the view to new container
                        guide.addToContainer(view2, forceMove: false)
                        XCTAssert(guide.container!.isEqualTo(view1))
                        XCTAssertEqual(view1.layoutGuides.count, 1)
                        XCTAssertEqual(view2.layoutGuides.count, 0)
                    }
                }
                
                do { // when forceMove is true
                    do { // it should not move the view to new container
                        guide.addToContainer(view3, forceMove: true)
                        XCTAssert(guide.container!.isEqualTo(view3))
                        XCTAssertEqual(view1.layoutGuides.count, 0)
                        XCTAssertEqual(view2.layoutGuides.count, 0)
                        XCTAssertEqual(view3.layoutGuides.count, 1)
                    }
                }
            }
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