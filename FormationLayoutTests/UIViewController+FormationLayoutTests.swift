//
//  UIViewController+FormationLayoutTests.swift
//  FormationLayout
//
//  Created by Evan on 3/01/16.
//  Copyright © 2016 evancoding.com. All rights reserved.
//

import XCTest

class UIViewController_FormationLayoutTests: XCTestCase {

    func testLayoutGuideView() {
        XCTAssertNotNil(UIViewController().topLayoutGuideView)
        XCTAssertNotNil(UIViewController().bottomLayoutGuideView)
    }

}
