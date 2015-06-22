//
//  GroupFormation+SelfTests.swift
//  FormationLayout
//
//  Created by Evan on 23/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class GroupFormation_SelfTests: XCTestCase {

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

    func testWidthToHeight() {
        group.widthToHeight(by: 2, plus: 10)
        
        XCTAssertEqual(group[0].constraints.count, 1)
        XCTAssertEqual(group[1].constraints.count, 1)
        XCTAssertEqual(group[2].constraints.count, 1)
        
        checkConstraint(group[0].constraints[0], view1, .Width, .Height, 2, 10)
        checkConstraint(group[1].constraints[0], view2, .Width, .Height, 2, 10)
        checkConstraint(group[2].constraints[0], view3, .Width, .Height, 2, 10)
    }
    
    func testHeightToWidth() {
        group.heightToWidth(by: 2, plus: 10)
        
        XCTAssertEqual(group[0].constraints.count, 1)
        XCTAssertEqual(group[1].constraints.count, 1)
        XCTAssertEqual(group[2].constraints.count, 1)
        
        checkConstraint(group[0].constraints[0], view1, .Height, .Width, 2, 10)
        checkConstraint(group[1].constraints[0], view2, .Height, .Width, 2, 10)
        checkConstraint(group[2].constraints[0], view3, .Height, .Width, 2, 10)
    }
    
    private func checkConstraint(constraint: NSLayoutConstraint, _ view: UIView, _ firstAttribute: NSLayoutAttribute, _ secondAttribute: NSLayoutAttribute, _ multiplier: CGFloat = 1, _ constant: CGFloat = 0) {
        
        XCTAssertEqual(constraint.firstAttribute, firstAttribute)
        XCTAssertEqual(constraint.secondAttribute, secondAttribute)
        
        XCTAssertEqual(constraint.firstItem as! UIView, view)
        XCTAssertEqual(constraint.secondItem as! UIView, view)
        
        XCTAssertEqual(constraint.multiplier, multiplier)
        XCTAssertEqual(constraint.constant, constant)
    }
}
