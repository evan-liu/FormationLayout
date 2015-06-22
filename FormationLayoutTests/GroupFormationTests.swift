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
    
    // FormationTakesLayoutTarget
    func testFormationTakesLayoutTarget() {
        // should call each view formation but not the target view itself with the same attribute.
        
        var checked = 0
        func check(constraint: NSLayoutConstraint, _ attribute: NSLayoutAttribute, _ secondView: UIView, _ secondAttribute: NSLayoutAttribute) {
            XCTAssertEqual(constraint.firstAttribute, attribute)
            XCTAssertEqual(constraint.secondItem as! UIView, secondView)
            XCTAssertEqual(constraint.secondAttribute, secondAttribute)
            checked++
        }
        
        group.left(view1.left) { check($0, .Left, self.view1, .Left) }
        group.right(view1.left) { check($0, .Right, self.view1, .Left) }

        XCTAssertEqual(checked, 5)
        XCTAssertEqual(group.viewFormations[0].constraints.count, 1)
        XCTAssertEqual(group.viewFormations[1].constraints.count, 2)
        XCTAssertEqual(group.viewFormations[2].constraints.count, 2)
    }
    
    // FormationTakesCGFloat
    func testFormationTakesCGFloat() {
        // should call each view formation
        
        var checked = 0
        func check(constraint: NSLayoutConstraint, _ attribute: NSLayoutAttribute, _ constant: CGFloat) {
            XCTAssertEqual(constraint.firstAttribute, attribute)
            XCTAssertEqual(constraint.constant, constant)
            checked++
        }
        
        group.width(100) { check($0, .Width, 100) }
        
        XCTAssertEqual(checked, 3)
        XCTAssertEqual(group.viewFormations[0].constraints.count, 1)
        XCTAssertEqual(group.viewFormations[1].constraints.count, 1)
        XCTAssertEqual(group.viewFormations[2].constraints.count, 1)
    }

    // FormationTakesUIView
    func testFormationTakesUIView() {
        // should call each view formation but not the target view itself
        
        var checked = 0
        func check(constraint: NSLayoutConstraint, _ secondView: UIView) {
            XCTAssertEqual(constraint.secondItem as! UIView, secondView)
            checked++
        }
        
        group.centerX(view1) { check($0, self.view1) }
        group.center(view2) { check($0, self.view2) }
        
        XCTAssertEqual(checked, 6)
        XCTAssertEqual(group.viewFormations[0].constraints.count, 2)
        XCTAssertEqual(group.viewFormations[1].constraints.count, 1)
        XCTAssertEqual(group.viewFormations[2].constraints.count, 3)
    }
    
    func testExecutionMethods() {
        var checked = 0
        
        // execute()
        // should call the code block with the group itself
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
        
        // forEach()
        // should call the code block with each `ViewFormation`
        var checking = 0
        group
            .forEach { _, index, _ in
                XCTAssertEqual(index, checking)
                checking++
            }
        XCTAssertEqual(checking, 3)
        
        // forEachReverse()
        // shoudl call from back
        checking = 2
        group
            .forEachReverse { _, index, _ in
                XCTAssertEqual(index, checking)
                checking--
        }
        XCTAssertEqual(checking, -1)
        
        // executeAt() / first() / last()
        group
            .executeAt(1) { XCTAssertEqual($0.view, view2) }
            .first { XCTAssertEqual($0.view, view1) }
            .last { XCTAssertEqual($0.view, view3) }
    }
    
    func testHelperProperties() {
        XCTAssertEqual(group.count, 3)
        XCTAssertEqual(group.firstView, view1)
        XCTAssertEqual(group.lastView, view3)
        XCTAssertEqual(group[1].view, view2)
    }
}
