//
//  GroupFormation+ExecuteTests.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class GroupFormation_ExecuteTests: XCTestCase {

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
