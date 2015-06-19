//
//  FormationViewTests.swift
//  FormationLayout
//
//  Created by Evan on 18/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class FormationViewTests: XCTestCase {
    var layout: FormationLayout!
    var uiView: UIView!
    var fView: FormationView!

    override func setUp() {
        super.setUp()
        
        layout = FormationLayout(rootView: UIView())
        
        uiView = UIView()
        fView = layout.view(uiView)
    }
    
    // init()
    func testInit() {
        // should set translatesAutoresizingMaskIntoConstraints to false
        XCTAssertEqual(uiView.translatesAutoresizingMaskIntoConstraints, false)
    }
    
    // constraint factory methods
    func testConstraintFactoryMethods() {
        let uiView2 = UIView()
        
        // should create constraint and add to constraints
        fView.attribute(.Left, relatedBy: .Equal, target: uiView2.left)
        XCTAssertEqual(fView.constraints.count, 1)
        
        // should set up constraint and call handler
        fView.attribute(.Left, relatedBy: .Equal, target: uiView2.centerX, priority: 10) { constraint in
            XCTAssertEqual(constraint.firstItem as! UIView, self.uiView)
            XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Left)
            
            XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
            
            XCTAssertEqual(constraint.secondItem as! UIView, uiView2)
            XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.CenterX)
            
            XCTAssertEqual(constraint.priority, 10)
        }
    }
    
    // attribute helper extentions
    func testAttributeHelperExtentions() {
        let uiView2 = UIView()
        
        // should set up constraint and call handler
        fView
            .left(uiView2.centerX, priority: 10) { constraint in
                XCTAssertEqual(constraint.firstItem as! UIView, self.uiView)
                XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Left)
                
                XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
                
                XCTAssertEqual(constraint.secondItem as! UIView, uiView2)
                XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.CenterX)
                
                XCTAssertEqual(constraint.priority, 10)
            }
            .leftEqual(uiView2.left) { XCTAssertEqual($0.relation, NSLayoutRelation.Equal)}
            .leftLessThanOrEqual(uiView2.left) { XCTAssertEqual($0.relation, NSLayoutRelation.LessThanOrEqual)}
            .leftGreaterThanOrEqual(uiView2.left) { XCTAssertEqual($0.relation, NSLayoutRelation.GreaterThanOrEqual)}
        
        // should add to constraints
        XCTAssertEqual(fView.constraints.count, 4)
        
        // should support other attribute
        var checked = 0
        func checkAttribute(constraint: NSLayoutConstraint, _ attribute: NSLayoutAttribute, _ relation: NSLayoutRelation, _ constant: CGFloat = 0) {
            XCTAssertEqual(constraint.firstAttribute, attribute)
            XCTAssertEqual(constraint.relation, relation)
            XCTAssertEqual(constraint.constant, constant)
            checked++
        }
        
        fView
            .right(uiView2.right) { checkAttribute($0, .Right, .Equal) }
            .rightEqual(uiView2.right) { checkAttribute($0, .Right, .Equal) }
            .rightLessThanOrEqual(uiView2.right) { checkAttribute($0, .Right, .LessThanOrEqual) }
            .rightGreaterThanOrEqual(uiView2.right) { checkAttribute($0, .Right, .GreaterThanOrEqual) }
            
            .top(uiView2.top) { checkAttribute($0, .Top, .Equal) }
            .topEqual(uiView2.top) { checkAttribute($0, .Top, .Equal) }
            .topLessThanOrEqual(uiView2.top) { checkAttribute($0, .Top, .LessThanOrEqual) }
            .topGreaterThanOrEqual(uiView2.top) { checkAttribute($0, .Top, .GreaterThanOrEqual) }
            
            .bottom(uiView2.bottom) { checkAttribute($0, .Bottom, .Equal) }
            .bottomEqual(uiView2.bottom) { checkAttribute($0, .Bottom, .Equal) }
            .bottomLessThanOrEqual(uiView2.bottom) { checkAttribute($0, .Bottom, .LessThanOrEqual) }
            .bottomGreaterThanOrEqual(uiView2.bottom) { checkAttribute($0, .Bottom, .GreaterThanOrEqual) }
            
            .leading(uiView2.leading) { checkAttribute($0, .Leading, .Equal) }
            .leadingEqual(uiView2.leading) { checkAttribute($0, .Leading, .Equal) }
            .leadingLessThanOrEqual(uiView2.leading) { checkAttribute($0, .Leading, .LessThanOrEqual) }
            .leadingGreaterThanOrEqual(uiView2.leading) { checkAttribute($0, .Leading, .GreaterThanOrEqual) }
            
            .trailing(uiView2.trailing) { checkAttribute($0, .Trailing, .Equal) }
            .trailingEqual(uiView2.trailing) { checkAttribute($0, .Trailing, .Equal) }
            .trailingLessThanOrEqual(uiView2.trailing) { checkAttribute($0, .Trailing, .LessThanOrEqual) }
            .trailingGreaterThanOrEqual(uiView2.trailing) { checkAttribute($0, .Trailing, .GreaterThanOrEqual) }
            
            .centerX(uiView2.centerX) { checkAttribute($0, .CenterX, .Equal) }
            .centerXEqual(uiView2.centerX) { checkAttribute($0, .CenterX, .Equal) }
            .centerXLessThanOrEqual(uiView2.centerX) { checkAttribute($0, .CenterX, .LessThanOrEqual) }
            .centerXGreaterThanOrEqual(uiView2.centerX) { checkAttribute($0, .CenterX, .GreaterThanOrEqual) }
        
            .centerY(uiView2.centerY) { checkAttribute($0, .CenterY, .Equal) }
            .centerYEqual(uiView2.centerY) { checkAttribute($0, .CenterY, .Equal) }
            .centerYLessThanOrEqual(uiView2.centerY) { checkAttribute($0, .CenterY, .LessThanOrEqual) }
            .centerYGreaterThanOrEqual(uiView2.centerY) { checkAttribute($0, .CenterY, .GreaterThanOrEqual) }
        
            .baseline(uiView2.baseline) { checkAttribute($0, .Baseline, .Equal) }
            .baselineEqual(uiView2.baseline) { checkAttribute($0, .Baseline, .Equal) }
            .baselineLessThanOrEqual(uiView2.baseline) { checkAttribute($0, .Baseline, .LessThanOrEqual) }
            .baselineGreaterThanOrEqual(uiView2.baseline) { checkAttribute($0, .Baseline, .GreaterThanOrEqual) }
        
            .firstBaseline(uiView2.firstBaseline) { checkAttribute($0, .FirstBaseline, .Equal) }
            .firstBaselineEqual(uiView2.firstBaseline) { checkAttribute($0, .FirstBaseline, .Equal) }
            .firstBaselineLessThanOrEqual(uiView2.firstBaseline) { checkAttribute($0, .FirstBaseline, .LessThanOrEqual) }
            .firstBaselineGreaterThanOrEqual(uiView2.firstBaseline) { checkAttribute($0, .FirstBaseline, .GreaterThanOrEqual) }
        
            .width(uiView2.width) { checkAttribute($0, .Width, .Equal) }
            .widthEqual(uiView2.width) { checkAttribute($0, .Width, .Equal) }
            .widthLessThanOrEqual(uiView2.width) { checkAttribute($0, .Width, .LessThanOrEqual) }
            .widthGreaterThanOrEqual(uiView2.width) { checkAttribute($0, .Width, .GreaterThanOrEqual) }
        
            .height(uiView2.height) { checkAttribute($0, .Height, .Equal) }
            .heightEqual(uiView2.height) { checkAttribute($0, .Height, .Equal) }
            .heightLessThanOrEqual(uiView2.height) { checkAttribute($0, .Height, .LessThanOrEqual) }
            .heightGreaterThanOrEqual(uiView2.height) { checkAttribute($0, .Height, .GreaterThanOrEqual) }
        
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