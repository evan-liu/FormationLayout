//
//  LayoutBlockTests.swift
//  FormationLayout
//
//  Created by Evan on 22/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class LayoutBlockTests: XCTestCase {

    var rootView: UIView!
    var layout: FormationLayout!
    
    override func setUp() {
        super.setUp()
        rootView = UIView()
        layout = FormationLayout(rootView: rootView)
    }

    // block()
    func testBlock() {
        // should make formations install/except size classes together
        
        let view = UIView()
        let f1 = layout.view(view)
        XCTAssertEqual(f1.installSizeClasses.count, 0)
        XCTAssertEqual(f1.exceptSizeClasses.count, 0)
        
        var f2: ViewFormation!
        var f3: ViewFormation!
        layout.block {
            f2 = layout.view(view)
            f3 = layout.view(view)
            }.install(.WCompact)
        
        XCTAssertEqual(f1.installSizeClasses.count, 0)
        XCTAssertEqual(f1.exceptSizeClasses.count, 0)
        XCTAssertEqual(f2.installSizeClasses.count, 1)
        XCTAssertEqual(f2.exceptSizeClasses.count, 0)
        XCTAssertEqual(f3.installSizeClasses.count, 1)
        XCTAssertEqual(f3.exceptSizeClasses.count, 0)
        
        var f4: ViewFormation!
        var f5: ViewFormation!
        layout.block {
            f4 = layout.view(view)
            f5 = layout.view(view)
            }.except(.WCompact)
        
        XCTAssertEqual(f1.installSizeClasses.count, 0)
        XCTAssertEqual(f1.exceptSizeClasses.count, 0)
        XCTAssertEqual(f2.installSizeClasses.count, 1)
        XCTAssertEqual(f2.exceptSizeClasses.count, 0)
        XCTAssertEqual(f3.installSizeClasses.count, 1)
        XCTAssertEqual(f3.exceptSizeClasses.count, 0)
        XCTAssertEqual(f4.installSizeClasses.count, 0)
        XCTAssertEqual(f4.exceptSizeClasses.count, 1)
        XCTAssertEqual(f5.installSizeClasses.count, 0)
        XCTAssertEqual(f5.exceptSizeClasses.count, 1)
    }
}
