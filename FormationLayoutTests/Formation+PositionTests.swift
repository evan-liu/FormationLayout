//
//  Formation+PositionTests.swift
//  FormationLayout
//
//  Created by Evan on 21/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class Formation_PositionTests: XCTestCase {
    var view: UIView!
    var formation: ViewFormation!
    
    var view2: UIView!
    
    var checked = 0
    
    override func setUp() {
        super.setUp()
        
        view = UIView()
        formation = ViewFormation(view: view)
        
        view2 = UIView()
        
        checked = 0
    }
    
    func testUIView() {
        formation.above(view2) { self.check($0, .Bottom, .Top) }
        formation.below(view2) { self.check($0, .Top, .Bottom) }
        formation.before(view2) { self.check($0, .Trailing, .Leading) }
        formation.after(view2) { self.check($0, .Leading, .Trailing) }
        
        verifyChecked(4)
    }
    
    func testLayoutTarget() {
        formation.above(view2 + 10) { self.check($0, .Bottom, .Top, 1, 10) }
        formation.below(view2 - 10) { self.check($0, .Top, .Bottom, 1, -10) }
        formation.before(view2 + 5.5) { self.check($0, .Trailing, .Leading, 1, 5.5) }
        formation.after(view2 - 5.5) { self.check($0, .Leading, .Trailing, 1, -5.5) }
        
        verifyChecked(4)
    }
    
    private func check(constraint: NSLayoutConstraint, _ firstAttribute: NSLayoutAttribute, _ secondAttribute: NSLayoutAttribute, _ multiplier: CGFloat = 1, _ constant: CGFloat = 0) {
        
        XCTAssertEqual(constraint.firstItem as? UIView, view)
        XCTAssertEqual(constraint.secondItem as? UIView, view2)
        
        XCTAssertEqual(constraint.firstAttribute, firstAttribute)
        XCTAssertEqual(constraint.secondAttribute, secondAttribute)
        
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
        
        XCTAssertEqual(constraint.multiplier, multiplier)
        XCTAssertEqual(constraint.constant, constant)
        
        checked++
    }
    
    private func verifyChecked(v: Int) {
        XCTAssertEqual(checked, v)
    }
}