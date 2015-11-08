//
//  ViewFormationTests.swift
//  FormationLayout
//
//  Created by Evan on 18/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class ViewFormationTests: XCTestCase {
    var view: UIView!
    var formation: ViewFormation!
    
    var view2: UIView!

    override func setUp() {
        super.setUp()

        view = UIView()
        formation = ViewFormation(view: view)
        
        view2 = UIView()
    }
    
    // init()
    func testInit() {
        // should set translatesAutoresizingMaskIntoConstraints to false
        XCTAssertEqual(view.translatesAutoresizingMaskIntoConstraints, false)
    }
    
    // active property
    func testActive() {
        // should change active property of constraints
        
        formation.width(10).height(20)
        
        XCTAssertFalse(formation.constraints[0].active)
        XCTAssertFalse(formation.constraints[1].active)
        
        formation.active = true
        XCTAssertTrue(formation.constraints[0].active)
        XCTAssertTrue(formation.constraints[1].active)
        
        formation.active = false
        XCTAssertFalse(formation.constraints[0].active)
        XCTAssertFalse(formation.constraints[1].active)
    }
    
    // checkSizeClass()
    func testCheckSizeClass() {
        
        // should return true if no size classes installed
        XCTAssertTrue(formation.checkSizeClass(.Unspecified, .Unspecified))
        XCTAssertTrue(formation.checkSizeClass(.Unspecified, .Compact))
        XCTAssertTrue(formation.checkSizeClass(.Unspecified, .Regular))
        XCTAssertTrue(formation.checkSizeClass(.Compact, .Unspecified))
        XCTAssertTrue(formation.checkSizeClass(.Compact, .Compact))
        XCTAssertTrue(formation.checkSizeClass(.Compact, .Regular))
        XCTAssertTrue(formation.checkSizeClass(.Regular, .Unspecified))
        XCTAssertTrue(formation.checkSizeClass(.Regular, .Compact))
        XCTAssertTrue(formation.checkSizeClass(.Regular, .Regular))
        
        // should return true only for installed size classes
        formation.install(.WRegular)
        formation.install(.BothCompact)
        
        XCTAssertFalse(formation.checkSizeClass(.Unspecified, .Unspecified))
        XCTAssertFalse(formation.checkSizeClass(.Unspecified, .Compact))
        XCTAssertFalse(formation.checkSizeClass(.Unspecified, .Regular))
        XCTAssertFalse(formation.checkSizeClass(.Compact, .Unspecified))
        XCTAssertTrue(formation.checkSizeClass(.Compact, .Compact))
        XCTAssertFalse(formation.checkSizeClass(.Compact, .Regular))
        XCTAssertTrue(formation.checkSizeClass(.Regular, .Unspecified))
        XCTAssertTrue(formation.checkSizeClass(.Regular, .Compact))
        XCTAssertTrue(formation.checkSizeClass(.Regular, .Regular))
        
        // should return false for excepted size classes
        formation.except(.HRegular)
        formation.except(.WRegularHCompact)
        
        XCTAssertFalse(formation.checkSizeClass(.Unspecified, .Unspecified))
        XCTAssertFalse(formation.checkSizeClass(.Unspecified, .Compact))
        XCTAssertFalse(formation.checkSizeClass(.Unspecified, .Regular))
        XCTAssertFalse(formation.checkSizeClass(.Compact, .Unspecified))
        XCTAssertTrue(formation.checkSizeClass(.Compact, .Compact))
        XCTAssertFalse(formation.checkSizeClass(.Compact, .Regular))
        XCTAssertTrue(formation.checkSizeClass(.Regular, .Unspecified))
        XCTAssertFalse(formation.checkSizeClass(.Regular, .Compact))
        XCTAssertFalse(formation.checkSizeClass(.Regular, .Regular))
    }
    
    func testAddConstraint() {
        // should set constraint.active to formation.active
        
        formation.active = false
        formation.width(10)
        XCTAssertFalse(formation.constraints[0].active)
        
        formation.active = true
        formation.height(10)
        XCTAssertTrue(formation.constraints[1].active)
    }
    
}