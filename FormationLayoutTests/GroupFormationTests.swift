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
        XCTAssertEqual(group.viewFormations[0].view, view1)
        XCTAssertEqual(group.viewFormations[1].view, view2)
        XCTAssertEqual(group.viewFormations[2].view, view3)
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

    // execute()
    func testExecute() {
        // should call the code block with the group itself

        var checked = 0
        group
            .execute { group in
                XCTAssertEqual(group.count, 3)
                checked++
            }
            .execute {
                XCTAssertEqual($0.firstView, view1)
                checked++
            }
        XCTAssertEqual(checked, 2)
    }
    
    // forEach()
    func testForEach() {
        // should call the code block with each `ViewFormation`
        
        var checking = 0
        group
            .forEach { _, index, _ in
                XCTAssertEqual(index, checking)
                checking++
        }
        XCTAssertEqual(checking, 3)

    }
    
    // forEachReverse()
    func testForEachReverse() {
        // shoudl call from back
        
        var checking = 2
        group
            .forEachReverse { _, index, _ in
                XCTAssertEqual(index, checking)
                checking--
        }
        XCTAssertEqual(checking, -1)
    }
    
    // at() / first() / last()
    func testAt() {
        group
            .at(1) { XCTAssertEqual($0.view, view2) }
            .first { XCTAssertEqual($0.view, view1) }
            .last { XCTAssertEqual($0.view, view3) }
    }
}