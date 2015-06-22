//
//  GroupFormation+SpaceTests.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class GroupFormation_SpaceTests: XCTestCase {
    
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

    func testHSpace() {
        var index = 1
        group.hSpace(10) {
            XCTAssertEqual($0.firstItem as! UIView, self.group[index].view)
            XCTAssertEqual($0.firstAttribute, .Leading)
            XCTAssertEqual($0.secondItem as! UIView, self.group[index - 1].view)
            XCTAssertEqual($0.secondAttribute, .Trailing)
            XCTAssertEqual($0.constant, 10)
            index++
        }
    }
    
    func testVSpace() {
        var index = 1
        group.vSpace(10) {
            XCTAssertEqual($0.firstItem as! UIView, self.group[index].view)
            XCTAssertEqual($0.firstAttribute, .Top)
            XCTAssertEqual($0.secondItem as! UIView, self.group[index - 1].view)
            XCTAssertEqual($0.secondAttribute, .Bottom)
            XCTAssertEqual($0.constant, 10)
            index++
        }
    }
}