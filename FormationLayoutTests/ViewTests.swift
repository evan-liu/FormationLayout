//
//  ViewTests.swift
//  FormationLayout
//
//  Created by Evan on 27/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

func XCTAssertEqual(lhs: View, _ rhs: View) {
    XCTAssert(lhs.isEqualTo(rhs))
}