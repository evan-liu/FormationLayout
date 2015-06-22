//
//  ViewFormation+LayoutTargetTests.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class ViewFormation_LayoutTargetTests: XCTestCase {

    var view: UIView!
    var formation: ViewFormation!
    
    var view2: UIView!
    
    override func setUp() {
        super.setUp()
        
        view = UIView()
        formation = ViewFormation(view: view)
        
        view2 = UIView()
    }
    
    // constraint factory methods
    func testConstraintFactoryMethods() {
        // should create constraint and add to constraints
        formation.attribute(.Left, relatedBy: .Equal, target: view2.left)
        XCTAssertEqual(formation.constraints.count, 1)
        
        // should set up constraint and call handler
        formation.attribute(.Left, relatedBy: .Equal, target: view2.centerX, priority: 10) { constraint in
            XCTAssertEqual(constraint.firstItem as! UIView, self.view)
            XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Left)
            
            XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
            
            XCTAssertEqual(constraint.secondItem as! UIView, self.view2)
            XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.CenterX)
            
            XCTAssertEqual(constraint.priority, 10)
        }
    }
    
    // attribute helper extentions
    func testAttributeHelperExtensions() {
        // should set up constraint and call handler
        formation
            .left(view2.centerX, priority: 10) { constraint in
                XCTAssertEqual(constraint.firstItem as! UIView, self.view)
                XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Left)
                
                XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
                
                XCTAssertEqual(constraint.secondItem as! UIView, self.view2)
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
        
        XCTAssertEqual(checked, 4 * 11)
    
        // Size
        checked = 0
        formation
            .size(view2.width) { checkAttribute($0, $0.firstAttribute, .Equal) }
            .sizeEqual(view2.width) { checkAttribute($0, $0.firstAttribute, .Equal) }
            .sizeLessThanOrEqual(view2.width) { checkAttribute($0, $0.firstAttribute, .LessThanOrEqual) }
            .sizeGreaterThanOrEqual(view2.width) { checkAttribute($0, $0.firstAttribute, .GreaterThanOrEqual) }
        XCTAssertEqual(checked, 4 * 2)
    }

    // LayoutTarget with NSLayoutAttribute.NotAnAttribute
    func testNotAnAttribute() {
        // should set secondAttribute to firstAttrubute
        formation.width(view2 * 2) {
            XCTAssertEqual($0.secondAttribute, .Width)
            XCTAssertEqual($0.multiplier, 2)
        }
        
        var sizeSet: Set<NSLayoutAttribute> = [.Width, .Height]
        formation.size(view2 * 1.5) {
            XCTAssertEqual($0.secondAttribute, $0.firstAttribute)
            XCTAssertEqual($0.multiplier, 1.5)
            
            XCTAssert(sizeSet.contains($0.secondAttribute))
            sizeSet.remove($0.secondAttribute)
        }
        XCTAssertEqual(sizeSet.count, 0)
    }
    
    // Layout target with same view and attribute
    func testLayoutTargetWithSameViewAndAttribute() {
        // should not create constraints
        formation.width(view + 10)
        XCTAssertEqual(formation.constraints.count, 0)
    }
}
