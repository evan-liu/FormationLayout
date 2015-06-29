//
//  FormationLayout+GroupTests.swift
//  FormationLayout
//
//  Created by Evan on 29/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class FormationLayout_GroupTests: XCTestCase {
    
    // group()
    func testGroupFactoryMethods() {
        let rootView = UIView()
        let layout = FormationLayout(rootView: rootView)
        
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()
        let view4 = UIView()
        let view5 = UIView()
        let container0 = UIView()
        let container1 = UIView()
        let container2 = UIView()
        
        container0.addSubview(view1)
        
        // should add views to the root view is the view has no superView
        
        layout.group([view1, view2])
        layout.group(view2, view3)
        XCTAssertEqual(view1.superview!, container0)
        XCTAssertEqual(view2.superview!, rootView)
        XCTAssertEqual(view3.superview!, rootView)
        
        // should add/move views to the container
        
        layout.group(container: container1, views: view3, view4)
        XCTAssertEqual(view3.superview!, container1)
        XCTAssertEqual(view4.superview!, container1)
        
        // should not move the views if `moveView` is false
        
        layout.group(container: container2, views: [view4, view5], moveView: false)
        XCTAssertEqual(view4.superview!, container1)
        XCTAssertEqual(view5.superview!, container2)
    }

}
