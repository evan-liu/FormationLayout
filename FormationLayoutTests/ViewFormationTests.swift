//
//  ViewFormationTests.swift
//  FormationLayout
//
//  Created by Evan on 18/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class ViewFormationTests: XCTestCase {
    var view: UIView!
    var formation: ViewFormation!

    override func setUp() {
        super.setUp()

        view = UIView()
        formation = ViewFormation(view: view)
    }
    
    // init()
    func testInit() {
        // should set translatesAutoresizingMaskIntoConstraints to false
        XCTAssertEqual(view.translatesAutoresizingMaskIntoConstraints, false)
    }
    
    // constraint factory methods
    func testConstraintFactoryMethods() {
        let uiView2 = UIView()
        
        // should create constraint and add to constraints
        formation.attribute(.Left, relatedBy: .Equal, target: uiView2.left)
        XCTAssertEqual(formation.constraints.count, 1)
        
        // should set up constraint and call handler
        formation.attribute(.Left, relatedBy: .Equal, target: uiView2.centerX, priority: 10) { constraint in
            XCTAssertEqual(constraint.firstItem as! UIView, self.view)
            XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Left)
            
            XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
            
            XCTAssertEqual(constraint.secondItem as! UIView, uiView2)
            XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.CenterX)
            
            XCTAssertEqual(constraint.priority, 10)
        }
    }
    
    // attribute helper extentions
    func testAttributeHelperExtentions() {
        let view2 = UIView()
        
        // should set up constraint and call handler
        formation
            .left(view2.centerX, priority: 10) { constraint in
                XCTAssertEqual(constraint.firstItem as! UIView, self.view)
                XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Left)
                
                XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
                
                XCTAssertEqual(constraint.secondItem as! UIView, view2)
                XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.CenterX)
                
                XCTAssertEqual(constraint.priority, 10)
            }
            .leftEqual(view2.left) { XCTAssertEqual($0.relation, NSLayoutRelation.Equal)}
            .leftLessThanOrEqual(view2.left) { XCTAssertEqual($0.relation, NSLayoutRelation.LessThanOrEqual)}
            .leftGreaterThanOrEqual(view2.left) { XCTAssertEqual($0.relation, NSLayoutRelation.GreaterThanOrEqual)}
        
        // should add to constraints
        XCTAssertEqual(formation.constraints.count, 4)
        
        // should support other attribute
        var checked = 0
        func checkAttribute(constraint: NSLayoutConstraint, _ attribute: NSLayoutAttribute, _ relation: NSLayoutRelation, _ constant: CGFloat = 0) {
            XCTAssertEqual(constraint.firstAttribute, attribute)
            XCTAssertEqual(constraint.relation, relation)
            XCTAssertEqual(constraint.constant, constant)
            checked++
        }
        
        formation
            .right(view2.right) { checkAttribute($0, .Right, .Equal) }
            .rightEqual(view2.right) { checkAttribute($0, .Right, .Equal) }
            .rightLessThanOrEqual(view2.right) { checkAttribute($0, .Right, .LessThanOrEqual) }
            .rightGreaterThanOrEqual(view2.right) { checkAttribute($0, .Right, .GreaterThanOrEqual) }
            
            .top(view2.top) { checkAttribute($0, .Top, .Equal) }
            .topEqual(view2.top) { checkAttribute($0, .Top, .Equal) }
            .topLessThanOrEqual(view2.top) { checkAttribute($0, .Top, .LessThanOrEqual) }
            .topGreaterThanOrEqual(view2.top) { checkAttribute($0, .Top, .GreaterThanOrEqual) }
            
            .bottom(view2.bottom) { checkAttribute($0, .Bottom, .Equal) }
            .bottomEqual(view2.bottom) { checkAttribute($0, .Bottom, .Equal) }
            .bottomLessThanOrEqual(view2.bottom) { checkAttribute($0, .Bottom, .LessThanOrEqual) }
            .bottomGreaterThanOrEqual(view2.bottom) { checkAttribute($0, .Bottom, .GreaterThanOrEqual) }
            
            .leading(view2.leading) { checkAttribute($0, .Leading, .Equal) }
            .leadingEqual(view2.leading) { checkAttribute($0, .Leading, .Equal) }
            .leadingLessThanOrEqual(view2.leading) { checkAttribute($0, .Leading, .LessThanOrEqual) }
            .leadingGreaterThanOrEqual(view2.leading) { checkAttribute($0, .Leading, .GreaterThanOrEqual) }
            
            .trailing(view2.trailing) { checkAttribute($0, .Trailing, .Equal) }
            .trailingEqual(view2.trailing) { checkAttribute($0, .Trailing, .Equal) }
            .trailingLessThanOrEqual(view2.trailing) { checkAttribute($0, .Trailing, .LessThanOrEqual) }
            .trailingGreaterThanOrEqual(view2.trailing) { checkAttribute($0, .Trailing, .GreaterThanOrEqual) }
            
            .centerX(view2.centerX) { checkAttribute($0, .CenterX, .Equal) }
            .centerXEqual(view2.centerX) { checkAttribute($0, .CenterX, .Equal) }
            .centerXLessThanOrEqual(view2.centerX) { checkAttribute($0, .CenterX, .LessThanOrEqual) }
            .centerXGreaterThanOrEqual(view2.centerX) { checkAttribute($0, .CenterX, .GreaterThanOrEqual) }
        
            .centerY(view2.centerY) { checkAttribute($0, .CenterY, .Equal) }
            .centerYEqual(view2.centerY) { checkAttribute($0, .CenterY, .Equal) }
            .centerYLessThanOrEqual(view2.centerY) { checkAttribute($0, .CenterY, .LessThanOrEqual) }
            .centerYGreaterThanOrEqual(view2.centerY) { checkAttribute($0, .CenterY, .GreaterThanOrEqual) }
        
            .baseline(view2.baseline) { checkAttribute($0, .Baseline, .Equal) }
            .baselineEqual(view2.baseline) { checkAttribute($0, .Baseline, .Equal) }
            .baselineLessThanOrEqual(view2.baseline) { checkAttribute($0, .Baseline, .LessThanOrEqual) }
            .baselineGreaterThanOrEqual(view2.baseline) { checkAttribute($0, .Baseline, .GreaterThanOrEqual) }
        
            .firstBaseline(view2.firstBaseline) { checkAttribute($0, .FirstBaseline, .Equal) }
            .firstBaselineEqual(view2.firstBaseline) { checkAttribute($0, .FirstBaseline, .Equal) }
            .firstBaselineLessThanOrEqual(view2.firstBaseline) { checkAttribute($0, .FirstBaseline, .LessThanOrEqual) }
            .firstBaselineGreaterThanOrEqual(view2.firstBaseline) { checkAttribute($0, .FirstBaseline, .GreaterThanOrEqual) }
        
            .width(view2.width) { checkAttribute($0, .Width, .Equal) }
            .widthEqual(view2.width) { checkAttribute($0, .Width, .Equal) }
            .widthLessThanOrEqual(view2.width) { checkAttribute($0, .Width, .LessThanOrEqual) }
            .widthGreaterThanOrEqual(view2.width) { checkAttribute($0, .Width, .GreaterThanOrEqual) }
        
            .height(view2.height) { checkAttribute($0, .Height, .Equal) }
            .heightEqual(view2.height) { checkAttribute($0, .Height, .Equal) }
            .heightLessThanOrEqual(view2.height) { checkAttribute($0, .Height, .LessThanOrEqual) }
            .heightGreaterThanOrEqual(view2.height) { checkAttribute($0, .Height, .GreaterThanOrEqual) }
        
            .width(10) { checkAttribute($0, .Width, .Equal, 10) }
            .widthEqual(10) { checkAttribute($0, .Width, .Equal, 10) }
            .widthLessThanOrEqual(5.5) { checkAttribute($0, .Width, .LessThanOrEqual, 5.5) }
            .widthGreaterThanOrEqual(5.5) { checkAttribute($0, .Width, .GreaterThanOrEqual, 5.5) }
            
            .height(10) { checkAttribute($0, .Height, .Equal, 10) }
            .heightEqual(10) { checkAttribute($0, .Height, .Equal, 10) }
            .heightLessThanOrEqual(5.5) { checkAttribute($0, .Height, .LessThanOrEqual, 5.5) }
            .heightGreaterThanOrEqual(5.5) { checkAttribute($0, .Height, .GreaterThanOrEqual, 5.5) }
        
        XCTAssertEqual(checked, 4 * 13)
    }
}