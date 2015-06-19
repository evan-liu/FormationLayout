//
//  SizeClassTests.swift
//  FormationLayout
//
//  Created by Evan on 19/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class SizeClassTests: XCTestCase {
    
    func testMatch() {
        
        // wAny_hAny
        XCTAssertTrue(SizeClass.wAny_hAny.match(.Unspecified, .Unspecified))
        XCTAssertFalse(SizeClass.wAny_hAny.match(.Unspecified, .Compact))
        XCTAssertFalse(SizeClass.wAny_hAny.match(.Unspecified, .Regular))
        
        XCTAssertFalse(SizeClass.wAny_hAny.match(.Compact, .Unspecified))
        XCTAssertFalse(SizeClass.wAny_hAny.match(.Compact, .Compact))
        XCTAssertFalse(SizeClass.wAny_hAny.match(.Compact, .Regular))
        
        XCTAssertFalse(SizeClass.wAny_hAny.match(.Regular, .Unspecified))
        XCTAssertFalse(SizeClass.wAny_hAny.match(.Regular, .Compact))
        XCTAssertFalse(SizeClass.wAny_hAny.match(.Regular, .Regular))
        
        // wAny_hCompact
        XCTAssertTrue(SizeClass.wAny_hCompact.match(.Unspecified, .Unspecified))
        XCTAssertTrue(SizeClass.wAny_hCompact.match(.Unspecified, .Compact))
        XCTAssertFalse(SizeClass.wAny_hCompact.match(.Unspecified, .Regular))
        
        XCTAssertFalse(SizeClass.wAny_hCompact.match(.Compact, .Unspecified))
        XCTAssertFalse(SizeClass.wAny_hCompact.match(.Compact, .Compact))
        XCTAssertFalse(SizeClass.wAny_hCompact.match(.Compact, .Regular))
        
        XCTAssertFalse(SizeClass.wAny_hCompact.match(.Regular, .Unspecified))
        XCTAssertFalse(SizeClass.wAny_hCompact.match(.Regular, .Compact))
        XCTAssertFalse(SizeClass.wAny_hCompact.match(.Regular, .Regular))
        
        // wAny_hRegular
        XCTAssertTrue(SizeClass.wAny_hRegular.match(.Unspecified, .Unspecified))
        XCTAssertFalse(SizeClass.wAny_hRegular.match(.Unspecified, .Compact))
        XCTAssertTrue(SizeClass.wAny_hRegular.match(.Unspecified, .Regular))
        
        XCTAssertFalse(SizeClass.wAny_hRegular.match(.Compact, .Unspecified))
        XCTAssertFalse(SizeClass.wAny_hRegular.match(.Compact, .Compact))
        XCTAssertFalse(SizeClass.wAny_hRegular.match(.Compact, .Regular))
        
        XCTAssertFalse(SizeClass.wAny_hRegular.match(.Regular, .Unspecified))
        XCTAssertFalse(SizeClass.wAny_hRegular.match(.Regular, .Compact))
        XCTAssertFalse(SizeClass.wAny_hRegular.match(.Regular, .Regular))
        
        // wCompact_hAny
        XCTAssertTrue(SizeClass.wCompact_hAny.match(.Unspecified, .Unspecified))
        XCTAssertFalse(SizeClass.wCompact_hAny.match(.Unspecified, .Compact))
        XCTAssertFalse(SizeClass.wCompact_hAny.match(.Unspecified, .Regular))
        
        XCTAssertTrue(SizeClass.wCompact_hAny.match(.Compact, .Unspecified))
        XCTAssertFalse(SizeClass.wCompact_hAny.match(.Compact, .Compact))
        XCTAssertFalse(SizeClass.wCompact_hAny.match(.Compact, .Regular))
        
        XCTAssertFalse(SizeClass.wCompact_hAny.match(.Regular, .Unspecified))
        XCTAssertFalse(SizeClass.wCompact_hAny.match(.Regular, .Compact))
        XCTAssertFalse(SizeClass.wCompact_hAny.match(.Regular, .Regular))
        
        // wCompact_hCompact
        XCTAssertTrue(SizeClass.wCompact_hCompact.match(.Unspecified, .Unspecified))
        XCTAssertTrue(SizeClass.wCompact_hCompact.match(.Unspecified, .Compact))
        XCTAssertFalse(SizeClass.wCompact_hCompact.match(.Unspecified, .Regular))
        
        XCTAssertTrue(SizeClass.wCompact_hCompact.match(.Compact, .Unspecified))
        XCTAssertTrue(SizeClass.wCompact_hCompact.match(.Compact, .Compact))
        XCTAssertFalse(SizeClass.wCompact_hCompact.match(.Compact, .Regular))
        
        XCTAssertFalse(SizeClass.wCompact_hCompact.match(.Regular, .Unspecified))
        XCTAssertFalse(SizeClass.wCompact_hCompact.match(.Regular, .Compact))
        XCTAssertFalse(SizeClass.wCompact_hCompact.match(.Regular, .Regular))
        
        // wCompact_hRegular
        XCTAssertTrue(SizeClass.wCompact_hRegular.match(.Unspecified, .Unspecified))
        XCTAssertFalse(SizeClass.wCompact_hRegular.match(.Unspecified, .Compact))
        XCTAssertTrue(SizeClass.wCompact_hRegular.match(.Unspecified, .Regular))
        
        XCTAssertTrue(SizeClass.wCompact_hRegular.match(.Compact, .Unspecified))
        XCTAssertFalse(SizeClass.wCompact_hRegular.match(.Compact, .Compact))
        XCTAssertTrue(SizeClass.wCompact_hRegular.match(.Compact, .Regular))
        
        XCTAssertFalse(SizeClass.wCompact_hRegular.match(.Regular, .Unspecified))
        XCTAssertFalse(SizeClass.wCompact_hRegular.match(.Regular, .Compact))
        XCTAssertFalse(SizeClass.wCompact_hRegular.match(.Regular, .Regular))
        
        // wRegular_hAny
        XCTAssertTrue(SizeClass.wRegular_hAny.match(.Unspecified, .Unspecified))
        XCTAssertFalse(SizeClass.wRegular_hAny.match(.Unspecified, .Compact))
        XCTAssertFalse(SizeClass.wRegular_hAny.match(.Unspecified, .Regular))
        
        XCTAssertFalse(SizeClass.wRegular_hAny.match(.Compact, .Unspecified))
        XCTAssertFalse(SizeClass.wRegular_hAny.match(.Compact, .Compact))
        XCTAssertFalse(SizeClass.wRegular_hAny.match(.Compact, .Regular))
        
        XCTAssertTrue(SizeClass.wRegular_hAny.match(.Regular, .Unspecified))
        XCTAssertFalse(SizeClass.wRegular_hAny.match(.Regular, .Compact))
        XCTAssertFalse(SizeClass.wRegular_hAny.match(.Regular, .Regular))
        
        // wRegular_hCompact
        XCTAssertTrue(SizeClass.wRegular_hCompact.match(.Unspecified, .Unspecified))
        XCTAssertTrue(SizeClass.wRegular_hCompact.match(.Unspecified, .Compact))
        XCTAssertFalse(SizeClass.wRegular_hCompact.match(.Unspecified, .Regular))
        
        XCTAssertFalse(SizeClass.wRegular_hCompact.match(.Compact, .Unspecified))
        XCTAssertFalse(SizeClass.wRegular_hCompact.match(.Compact, .Compact))
        XCTAssertFalse(SizeClass.wRegular_hCompact.match(.Compact, .Regular))
        
        XCTAssertTrue(SizeClass.wRegular_hCompact.match(.Regular, .Unspecified))
        XCTAssertTrue(SizeClass.wRegular_hCompact.match(.Regular, .Compact))
        XCTAssertFalse(SizeClass.wRegular_hCompact.match(.Regular, .Regular))
        
        // wRegular_hRegular
        XCTAssertTrue(SizeClass.wRegular_hRegular.match(.Unspecified, .Unspecified))
        XCTAssertFalse(SizeClass.wRegular_hRegular.match(.Unspecified, .Compact))
        XCTAssertTrue(SizeClass.wRegular_hRegular.match(.Unspecified, .Regular))
        
        XCTAssertFalse(SizeClass.wRegular_hRegular.match(.Compact, .Unspecified))
        XCTAssertFalse(SizeClass.wRegular_hRegular.match(.Compact, .Compact))
        XCTAssertFalse(SizeClass.wRegular_hRegular.match(.Compact, .Regular))
        
        XCTAssertTrue(SizeClass.wRegular_hRegular.match(.Regular, .Unspecified))
        XCTAssertFalse(SizeClass.wRegular_hRegular.match(.Regular, .Compact))
        XCTAssertTrue(SizeClass.wRegular_hRegular.match(.Regular, .Regular))
        
    }
    
}
