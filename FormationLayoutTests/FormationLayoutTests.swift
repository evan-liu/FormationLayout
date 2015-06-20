//
//  FormationLayoutTests.swift
//  FormationLayout
//
//  Created by Evan on 18/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class FormationLayoutTests: XCTestCase {
    
    var rootView: UIView!
    var layout: FormationLayout!

    override func setUp() {
        super.setUp()
        rootView = UIView()
        layout = FormationLayout(rootView: rootView)
    }
    
    // init()
    func testInit() {
        // should save rootView
        XCTAssertEqual(layout.rootView, rootView)
        
        // should set translatesAutoresizingMaskIntoConstraints to false
        XCTAssertEqual(rootView.translatesAutoresizingMaskIntoConstraints, false)
    }
    
    // view()
    func testViewFactoryMethod() {
        let uiView = UIView()
        
        // should add to rootView if no container passed in
        layout.view(uiView)
        XCTAssertEqual(uiView.superview!, rootView)
        
        let container = UIView()
        let fView = layout.view(uiView, container: container)

        // should add view to container
        XCTAssertEqual(uiView.superview!, container)
        
        // should pass uiView
        XCTAssertEqual(fView.view, uiView)
        XCTAssertEqual(layout.view(uiView).view, uiView)
    }
    
    // group()
    func testGroupFactoryMethods() {
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
        
        layout.group(view1, view2, view3)
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
    
    // activate() 
    func testActivate() {
        // should call activate() of all formations
        
        let f1 = layout.view(UIView()).install(.HCompact)
        let f2 = layout.view(UIView()).install(.HRegular)
        
        layout.activate(.Compact, .Compact)
        XCTAssertTrue(f1.active)
        XCTAssertFalse(f2.active)
        
        layout.activate(UITraitCollection(verticalSizeClass: .Regular))
        XCTAssertFalse(f1.active)
        XCTAssertTrue(f2.active)
    }
    
    // block()
    func testBlock() {
        // should make formations install/except size classes together
        
        let view = UIView()
        let f1 = layout.view(view)
        XCTAssertEqual(f1.installSizeClasses.count, 0)
        XCTAssertEqual(f1.exceptSizeClasses.count, 0)
        
        var f2: ViewFormation!
        var f3: ViewFormation!
        layout.block {
            f2 = layout.view(view)
            f3 = layout.view(view)
        }.install(.WCompact)
        
        XCTAssertEqual(f1.installSizeClasses.count, 0)
        XCTAssertEqual(f1.exceptSizeClasses.count, 0)
        XCTAssertEqual(f2.installSizeClasses.count, 1)
        XCTAssertEqual(f2.exceptSizeClasses.count, 0)
        XCTAssertEqual(f3.installSizeClasses.count, 1)
        XCTAssertEqual(f3.exceptSizeClasses.count, 0)
        
        var f4: ViewFormation!
        var f5: ViewFormation!
        layout.block {
            f4 = layout.view(view)
            f5 = layout.view(view)
        }.except(.WCompact)
        
        XCTAssertEqual(f1.installSizeClasses.count, 0)
        XCTAssertEqual(f1.exceptSizeClasses.count, 0)
        XCTAssertEqual(f2.installSizeClasses.count, 1)
        XCTAssertEqual(f2.exceptSizeClasses.count, 0)
        XCTAssertEqual(f3.installSizeClasses.count, 1)
        XCTAssertEqual(f3.exceptSizeClasses.count, 0)
        XCTAssertEqual(f4.installSizeClasses.count, 0)
        XCTAssertEqual(f4.exceptSizeClasses.count, 1)
        XCTAssertEqual(f5.installSizeClasses.count, 0)
        XCTAssertEqual(f5.exceptSizeClasses.count, 1)
    }
}
