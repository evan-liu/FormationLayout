//
//  GroupFormation+CGFloatTests.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class GroupFormation_CGFloatTests: XCTestCase {

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

}
