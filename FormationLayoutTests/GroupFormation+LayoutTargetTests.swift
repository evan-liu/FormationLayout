//
//  GroupFormation+LayoutTargetTests.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class GroupFormation_LayoutTargetTests: XCTestCase {
    
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

}
