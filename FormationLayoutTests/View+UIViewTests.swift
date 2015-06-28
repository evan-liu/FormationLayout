//
//  View+UIViewTests.swift
//  FormationLayout
//
//  Created by Evan on 29/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class View_UIViewTests: XCTestCase {
    var view:UIView!
    
    override func setUp() {
        view = UIView()
    }
    
    // prepareForLayout()
    func testPrepareForLayout() {
        // should set translatesAutoresizingMaskIntoConstraints to false
        
        XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
        view.prepareForLayout()
        XCTAssertFalse(view.translatesAutoresizingMaskIntoConstraints)
    }
    
    // isEqualTo()
    func testIsEqualTo() {
        
        
        // should return true for the same view
        XCTAssertTrue(view.isEqualTo(view))
        
        // should return false for different view
        XCTAssertFalse(view.isEqualTo(UIView()))
        
        // should return false for different type
        if #available(iOS 9.0, *) {
            XCTAssertFalse(view.isEqualTo(UILayoutGuide()))
        }
    }
    
    // addToContainer()
    func testAddToContainer() {
        let container1 = UIView()
        let container2 = UIView()
        let container3 = UIView()
        
        do { // when the view is first created
            do { // it should has no container
                XCTAssert(view.container == nil)
            }
        }
        
        do { // when the view has no container
            do { // it should add the view to container
                view.addToContainer(container1, forceMove: false)
                XCTAssert(view.container!.isEqualTo(container1))
                XCTAssertEqual(container1.subviews.count, 1)
            }
            
            do { // when the view has contianer
                do { // when forceMove is false
                    do { // it should not move the view to new container
                        view.addToContainer(container2, forceMove: false)
                        XCTAssert(view.container!.isEqualTo(container1))
                        XCTAssertEqual(container1.subviews.count, 1)
                        XCTAssertEqual(container2.subviews.count, 0)
                    }
                }
                
                do { // when forceMove is true
                    do { // it should not move the view to new container
                        view.addToContainer(container3, forceMove: true)
                        XCTAssert(view.container!.isEqualTo(container3))
                        XCTAssertEqual(container1.subviews.count, 0)
                        XCTAssertEqual(container2.subviews.count, 0)
                        XCTAssertEqual(container3.subviews.count, 1)
                    }
                }
            }
        }
    }

}
