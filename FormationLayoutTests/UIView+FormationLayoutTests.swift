//
//  UIView+FormationLayoutTests.swift
//  FormationLayout
//
//  Created by Evan on 2/01/16.
//  Copyright © 2016 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class UIView_FormationLayoutTests: XCTestCase {
    
    func testLayout() {
        do { // should create FormatoinLayout with view as rootView
            let view = UIView()
            XCTAssertEqual(view.layout().rootView, view)
        }
        
        do { // should call layout block
            let view = UIView()
            let subview = UIView()
            let layouter = view.layout {
                $0.view(subview).center(view)
            }
            XCTAssertEqual(layouter.rootView, view)
            XCTAssertEqual(view.constraints.count, 2)
        }
    }

}
