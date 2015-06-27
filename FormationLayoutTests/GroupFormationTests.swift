//
//  GroupFormationTests.swift
//  FormationLayout
//
//  Created by Evan on 20/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class GroupFormationTests: XCTestCase {

    var view1: UIView!
    var view2: UIView!
    var view3: UIView!
    
    var group: GroupFormation!
    
    override func setUp() {
        super.setUp()
        
        view1 = UIView()
        view2 = UIView()
        view3 = UIView()
        
        group = GroupFormation(views: [view1, view2, view3])
    }
    
    // init()
    func testInit() {
        // should create an array of `ViewFormation` from the views.
        
        XCTAssertEqual(group.viewFormations.count, 3)
        XCTAssert(group.viewFormations[0].view.isEqualTo(view1))
        XCTAssert(group.viewFormations[1].view.isEqualTo(view2))
        XCTAssert(group.viewFormations[2].view.isEqualTo(view3))
    }
    
    // active
    func testActive() {
        // should change all viewFormations.
        
        XCTAssertFalse(group.viewFormations[0].active)
        XCTAssertFalse(group.viewFormations[1].active)
        XCTAssertFalse(group.viewFormations[2].active)
        
        group.active = true
        
        XCTAssertTrue(group.viewFormations[0].active)
        XCTAssertTrue(group.viewFormations[1].active)
        XCTAssertTrue(group.viewFormations[2].active)
    }
}