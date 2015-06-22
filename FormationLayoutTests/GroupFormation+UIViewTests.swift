//
//  GroupFormation+UIViewTests.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class GroupFormation_UIViewTests: XCTestCase {

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

}
