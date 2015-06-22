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
}
