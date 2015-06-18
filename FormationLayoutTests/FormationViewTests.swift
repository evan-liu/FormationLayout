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
}
