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
    
    // activate() 
    func testActivate() {
        // should call activate() of all formations
        
        let f1 = layout.view(UIView()).install(.wCompact_hCompact)
        let f2 = layout.view(UIView()).install(.wRegular_hRegular)
        
        layout.activate(.Compact, .Compact)
        XCTAssertTrue(f1.active)
        XCTAssertFalse(f2.active)
        
        layout.activate(.Regular, .Regular)
        XCTAssertFalse(f1.active)
        XCTAssertTrue(f2.active)
    }
}
