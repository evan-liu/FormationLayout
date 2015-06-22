//
//  ViewFormation+CGFloatTests.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class ViewFormation_CGFloatTests: XCTestCase {
    var view: UIView!
    var formation: ViewFormation!
    
    var view2: UIView!
    
    override func setUp() {
        super.setUp()
        
        view = UIView()
        formation = ViewFormation(view: view)
        
        view2 = UIView()
    }
    
    func testAttributeHelperExtensions() {
        var checked = 0
        func checkAttribute(constraint: NSLayoutConstraint, _ attribute: NSLayoutAttribute, _ relation: NSLayoutRelation, _ constant: CGFloat = 0) {
            XCTAssertEqual(constraint.firstAttribute, attribute)
            XCTAssertEqual(constraint.relation, relation)
            XCTAssertEqual(constraint.constant, constant)
            checked++
        }
        
        formation
            .width(10) { checkAttribute($0, .Width, .Equal, 10) }
            .widthEqual(10) { checkAttribute($0, .Width, .Equal, 10) }
            .widthLessThanOrEqual(5.5) { checkAttribute($0, .Width, .LessThanOrEqual, 5.5) }
            .widthGreaterThanOrEqual(5.5) { checkAttribute($0, .Width, .GreaterThanOrEqual, 5.5) }
            
            .height(10) { checkAttribute($0, .Height, .Equal, 10) }
            .heightEqual(10) { checkAttribute($0, .Height, .Equal, 10) }
            .heightLessThanOrEqual(5.5) { checkAttribute($0, .Height, .LessThanOrEqual, 5.5) }
            .heightGreaterThanOrEqual(5.5) { checkAttribute($0, .Height, .GreaterThanOrEqual, 5.5) }
        
        XCTAssertEqual(checked, 4 * 2)
        
        // Size
        checked = 0
        formation
            .size(10) { checkAttribute($0, $0.firstAttribute, .Equal, 10) }
            .sizeEqual(10) { checkAttribute($0, $0.firstAttribute, .Equal, 10) }
            .sizeLessThanOrEqual(5.5) { checkAttribute($0, $0.firstAttribute, .LessThanOrEqual, 5.5) }
            .sizeGreaterThanOrEqual(5.5) { checkAttribute($0, $0.firstAttribute, .GreaterThanOrEqual, 5.5) }
        XCTAssertEqual(checked, 2 * 4)
    }

}
