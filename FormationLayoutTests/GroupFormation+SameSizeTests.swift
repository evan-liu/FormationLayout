//
//  GroupFormation+SameSizeTests.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class GroupFormation_SameSizeTests: XCTestCase {

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

    // sameWidth()
    func testSameWidth() {
        // should make width of views equal to width of previous view.
        
        group.sameWidth()
        
        XCTAssertEqual(0, group[0].constraints.count)
        XCTAssertEqual(1, group[1].constraints.count)
        XCTAssertEqual(1, group[2].constraints.count)
        
        checkConstraint(group[1].constraints[0], .Width, view2, view1)
        checkConstraint(group[2].constraints[0], .Width, view3, view2)
    }
    
    // sameHeight()
    func testSameHeight() {
        // should make width of views equal to height of previous view.
        
        group.sameHeight()
        
        XCTAssertEqual(0, group[0].constraints.count)
        XCTAssertEqual(1, group[1].constraints.count)
        XCTAssertEqual(1, group[2].constraints.count)
        
        checkConstraint(group[1].constraints[0], .Height, view2, view1)
        checkConstraint(group[2].constraints[0], .Height, view3, view2)
    }
    
    // sameSize()
    func testSameSize() {
        // should make both width and height of views equal to its previous view.
        
        group.sameSize()
        
        XCTAssertEqual(0, group[0].constraints.count)
        XCTAssertEqual(2, group[1].constraints.count)
        XCTAssertEqual(2, group[2].constraints.count)
        
        checkConstraint(group[1].constraints[0], .Width, view2, view1)
        checkConstraint(group[1].constraints[1], .Height, view2, view1)
        
        checkConstraint(group[2].constraints[0], .Width, view3, view2)
        checkConstraint(group[2].constraints[1], .Height, view3, view2)
    }
    
    private func checkConstraint(constraint: NSLayoutConstraint, _ attribute: NSLayoutAttribute, _ firstView: UIView,  _ secondView: UIView) {
        XCTAssertEqual(constraint.firstAttribute, attribute)
        XCTAssertEqual(constraint.secondAttribute, attribute)
        
        XCTAssertEqual(constraint.firstItem as! UIView, firstView)
        XCTAssertEqual(constraint.secondItem as! UIView, secondView)
    }
}