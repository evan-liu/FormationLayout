//
//  GroupFormation+ElementsTests.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class GroupFormation_ElementsTests: XCTestCase {

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
    
    func testHelperProperties() {
        XCTAssertEqual(group.count, 3)
        
        XCTAssertEqual(group[1].view, view2)
        
        XCTAssertEqual(group.firstView, view1)
        XCTAssertEqual(group.lastView, view3)
    }
    
    func testViewAt() {
        XCTAssertEqual(group.viewAt(0), view1)
        XCTAssertEqual(group.viewAt(1), view2)
        XCTAssertEqual(group.viewAt(2), view3)
    }
    
    func testSpecialElements() {
        let view4 = UIView()
        
        var checked = 0
        func checkConstraint(constraint: NSLayoutConstraint, _ firstView: UIView, _ firstAttribute: NSLayoutAttribute, _ secondView: UIView, secondAttribute: NSLayoutAttribute, _ constant: CGFloat = 0) {
            XCTAssertEqual(constraint.firstItem as! UIView, firstView)
            XCTAssertEqual(constraint.firstAttribute, firstAttribute)
            
            XCTAssertEqual(constraint.secondItem as! UIView, secondView)
            XCTAssertEqual(constraint.secondAttribute, secondAttribute)
            
            XCTAssertEqual(constraint.constant, constant)
            
            checked++
        }

        group.firstLeading(view4) { checkConstraint($0, self.view1, .Leading, view4, secondAttribute: .Leading) }
        group.firstLeading(view4 + 10) { checkConstraint($0, self.view1, .Leading, view4, secondAttribute: .Leading, 10) }

        group.firstTop(view4) { checkConstraint($0, self.view1, .Top, view4, secondAttribute: .Top) }
        group.firstTop(view4 + 10) { checkConstraint($0, self.view1, .Top, view4, secondAttribute: .Top, 10) }
        
        group.lastTrailing(view4) { checkConstraint($0, self.view3, .Trailing, view4, secondAttribute: .Trailing) }
        group.lastTrailing(view4 + 10) { checkConstraint($0, self.view3, .Trailing, view4, secondAttribute: .Trailing, 10) }
        
        group.lastBottom(view4) { checkConstraint($0, self.view3, .Bottom, view4, secondAttribute: .Bottom) }
        group.lastBottom(view4 + 10) { checkConstraint($0, self.view3, .Bottom, view4, secondAttribute: .Bottom, 10) }
        
        XCTAssertEqual(checked, 8)
    }
}