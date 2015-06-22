//
//  ViewFormation+UIViewTests.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class ViewFormation_UIViewTests: XCTestCase {

    var view: UIView!
    var formation: ViewFormation!
    
    var view2: UIView!
    
    override func setUp() {
        super.setUp()
        
        view = UIView()
        formation = ViewFormation(view: view)
        
        view2 = UIView()
    }

    // +UIView
    func testUIViewExtensions() {
        var checked = 0
        func checkAttribute(constraint: NSLayoutConstraint, _ attribute: NSLayoutAttribute, _ secondView: UIView, _ relation: NSLayoutRelation = .Equal) {
            XCTAssertEqual(constraint.firstAttribute, attribute)
            XCTAssertEqual(constraint.secondAttribute, attribute)
            XCTAssertEqual(constraint.secondItem as! UIView, secondView)
            XCTAssertEqual(constraint.relation, relation)
            checked++
        }
        
        let view2 = UIView(frame: CGRectMake(100, 100, 100, 200))
        formation
            .center(view2) { checkAttribute($0, $0.firstAttribute, view2) } // * 2
            
            .centerX(view2) { checkAttribute($0, .CenterX, view2) }
            .centerY(view2) { checkAttribute($0, .CenterY, view2) }
            
            .top(view2) { checkAttribute($0, .Top, view2) }
            .bottom(view2) { checkAttribute($0, .Bottom, view2) }
            .leading(view2) { checkAttribute($0, .Leading, view2) }
            .trailing(view2) { checkAttribute($0, .Trailing, view2) }
            .baseline(view2) { checkAttribute($0, .Baseline, view2) }
        
        XCTAssertEqual(checked, 9)
        
        // should not add to the same view
        formation
            .centerX(view) { _ in XCTFail() }
            .center(view) { _ in XCTFail() }
    }
}
