//
//  ViewFormation+SelfTests.swift
//  FormationLayout
//
//  Created by Evan on 23/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class ViewFormation_SelfTests: XCTestCase {

    var view: UIView!
    var formation: ViewFormation!
    
    override func setUp() {
        super.setUp()
        
        view = UIView()
        formation = ViewFormation(view: view)
        
        checked = 0
    }
    
    func testSameAttribute() {
        // should ignore same attributes
        formation.attribute(.Width, relatedBy: .Equal, toAttribute: .Width, multiplier: 1.2, constant: 1, priority: 1) { _ in
            XCTFail()
        }
    }
    
    func testWidthAndHeight() {
        formation.widthToHeight(by: 2, plus: 10) { self.checkConstraint($0, .Width, .Height, 2, 10) }
        formation.heightToWidth(by: 2, plus: 10) { self.checkConstraint($0, .Height, .Width, 2, 10) }
        
        XCTAssertEqual(2, checked)
    }

    var checked = 0
    private func checkConstraint(constraint: NSLayoutConstraint, _ firstAttribute: NSLayoutAttribute, _ secondAttribute: NSLayoutAttribute, _ multiplier: CGFloat = 1, _ constant: CGFloat = 0) {
        
        XCTAssertEqual(constraint.firstAttribute, firstAttribute)
        XCTAssertEqual(constraint.secondAttribute, secondAttribute)
        
        XCTAssertEqual(constraint.firstItem as? UIView, view)
        XCTAssertEqual(constraint.secondItem as? UIView, view)
        
        XCTAssertEqual(constraint.multiplier, multiplier)
        XCTAssertEqual(constraint.constant, constant)
        
        checked++
    }
}
