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
    
    func testActivateAddedFormations() {
        // should activate added formations by default
        XCTAssertTrue(layout.view(UIView()).active)
        
        // when activateAddedFormations is set to false
        // should not activate added formations
        layout = FormationLayout(rootView: rootView, activateAddedFormations: false)
        XCTAssertFalse(layout.view(UIView()).active)
        
        // when added formation is active
        // should not deactive it
        let f = ViewFormation(view: UIView())
        f.active = true
        
        layout.addFormation(f)
        XCTAssertTrue(f.active)
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
    
    func testDeactivate() {
        let f1 = layout.view(UIView())
        let f2 = layout.group(UIView(), UIView(), UIView())
        
        layout.activate()
        XCTAssertTrue(f1.active)
        XCTAssertTrue(f2.active)
        
        layout.deactivate()
        XCTAssertFalse(f1.active)
        XCTAssertFalse(f2.active)
    }
}
