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
        
        // Any
        XCTAssertTrue(SizeClass.Any.match(.Unspecified, .Unspecified))
        XCTAssertTrue(SizeClass.Any.match(.Unspecified, .Compact))
        XCTAssertTrue(SizeClass.Any.match(.Unspecified, .Regular))
        
        XCTAssertTrue(SizeClass.Any.match(.Compact, .Unspecified))
        XCTAssertTrue(SizeClass.Any.match(.Compact, .Compact))
        XCTAssertTrue(SizeClass.Any.match(.Compact, .Regular))
        
        XCTAssertTrue(SizeClass.Any.match(.Regular, .Unspecified))
        XCTAssertTrue(SizeClass.Any.match(.Regular, .Compact))
        XCTAssertTrue(SizeClass.Any.match(.Regular, .Regular))
        
        // HCompact
        XCTAssertFalse(SizeClass.HCompact.match(.Unspecified, .Unspecified))
        XCTAssertTrue(SizeClass.HCompact.match(.Unspecified, .Compact))
        XCTAssertFalse(SizeClass.HCompact.match(.Unspecified, .Regular))
        
        XCTAssertFalse(SizeClass.HCompact.match(.Compact, .Unspecified))
        XCTAssertTrue(SizeClass.HCompact.match(.Compact, .Compact))
        XCTAssertFalse(SizeClass.HCompact.match(.Compact, .Regular))
        
        XCTAssertFalse(SizeClass.HCompact.match(.Regular, .Unspecified))
        XCTAssertTrue(SizeClass.HCompact.match(.Regular, .Compact))
        XCTAssertFalse(SizeClass.HCompact.match(.Regular, .Regular))
        
        // HRegular
        XCTAssertFalse(SizeClass.HRegular.match(.Unspecified, .Unspecified))
        XCTAssertFalse(SizeClass.HRegular.match(.Unspecified, .Compact))
        XCTAssertTrue(SizeClass.HRegular.match(.Unspecified, .Regular))
        
        XCTAssertFalse(SizeClass.HRegular.match(.Compact, .Unspecified))
        XCTAssertFalse(SizeClass.HRegular.match(.Compact, .Compact))
        XCTAssertTrue(SizeClass.HRegular.match(.Compact, .Regular))
        
        XCTAssertFalse(SizeClass.HRegular.match(.Regular, .Unspecified))
        XCTAssertFalse(SizeClass.HRegular.match(.Regular, .Compact))
        XCTAssertTrue(SizeClass.HRegular.match(.Regular, .Regular))
        
        // WCompact
        XCTAssertFalse(SizeClass.WCompact.match(.Unspecified, .Unspecified))
        XCTAssertFalse(SizeClass.WCompact.match(.Unspecified, .Compact))
        XCTAssertFalse(SizeClass.WCompact.match(.Unspecified, .Regular))
        
        XCTAssertTrue(SizeClass.WCompact.match(.Compact, .Unspecified))
        XCTAssertTrue(SizeClass.WCompact.match(.Compact, .Compact))
        XCTAssertTrue(SizeClass.WCompact.match(.Compact, .Regular))
        
        XCTAssertFalse(SizeClass.WCompact.match(.Regular, .Unspecified))
        XCTAssertFalse(SizeClass.WCompact.match(.Regular, .Compact))
        XCTAssertFalse(SizeClass.WCompact.match(.Regular, .Regular))
        
        // BothCompact
        XCTAssertFalse(SizeClass.BothCompact.match(.Unspecified, .Unspecified))
        XCTAssertFalse(SizeClass.BothCompact.match(.Unspecified, .Compact))
        XCTAssertFalse(SizeClass.BothCompact.match(.Unspecified, .Regular))
        
        XCTAssertFalse(SizeClass.BothCompact.match(.Compact, .Unspecified))
        XCTAssertTrue(SizeClass.BothCompact.match(.Compact, .Compact))
        XCTAssertFalse(SizeClass.BothCompact.match(.Compact, .Regular))
        
        XCTAssertFalse(SizeClass.BothCompact.match(.Regular, .Unspecified))
        XCTAssertFalse(SizeClass.BothCompact.match(.Regular, .Compact))
        XCTAssertFalse(SizeClass.BothCompact.match(.Regular, .Regular))
        
        // WCompactHRegular
        XCTAssertFalse(SizeClass.WCompactHRegular.match(.Unspecified, .Unspecified))
        XCTAssertFalse(SizeClass.WCompactHRegular.match(.Unspecified, .Compact))
        XCTAssertFalse(SizeClass.WCompactHRegular.match(.Unspecified, .Regular))
        
        XCTAssertFalse(SizeClass.WCompactHRegular.match(.Compact, .Unspecified))
        XCTAssertFalse(SizeClass.WCompactHRegular.match(.Compact, .Compact))
        XCTAssertTrue(SizeClass.WCompactHRegular.match(.Compact, .Regular))
        
        XCTAssertFalse(SizeClass.WCompactHRegular.match(.Regular, .Unspecified))
        XCTAssertFalse(SizeClass.WCompactHRegular.match(.Regular, .Compact))
        XCTAssertFalse(SizeClass.WCompactHRegular.match(.Regular, .Regular))
        
        // WRegular
        XCTAssertFalse(SizeClass.WRegular.match(.Unspecified, .Unspecified))
        XCTAssertFalse(SizeClass.WRegular.match(.Unspecified, .Compact))
        XCTAssertFalse(SizeClass.WRegular.match(.Unspecified, .Regular))
        
        XCTAssertFalse(SizeClass.WRegular.match(.Compact, .Unspecified))
        XCTAssertFalse(SizeClass.WRegular.match(.Compact, .Compact))
        XCTAssertFalse(SizeClass.WRegular.match(.Compact, .Regular))
        
        XCTAssertTrue(SizeClass.WRegular.match(.Regular, .Unspecified))
        XCTAssertTrue(SizeClass.WRegular.match(.Regular, .Compact))
        XCTAssertTrue(SizeClass.WRegular.match(.Regular, .Regular))
        
        // WRegularHCompact
        XCTAssertFalse(SizeClass.WRegularHCompact.match(.Unspecified, .Unspecified))
        XCTAssertFalse(SizeClass.WRegularHCompact.match(.Unspecified, .Compact))
        XCTAssertFalse(SizeClass.WRegularHCompact.match(.Unspecified, .Regular))
        
        XCTAssertFalse(SizeClass.WRegularHCompact.match(.Compact, .Unspecified))
        XCTAssertFalse(SizeClass.WRegularHCompact.match(.Compact, .Compact))
        XCTAssertFalse(SizeClass.WRegularHCompact.match(.Compact, .Regular))
        
        XCTAssertFalse(SizeClass.WRegularHCompact.match(.Regular, .Unspecified))
        XCTAssertTrue(SizeClass.WRegularHCompact.match(.Regular, .Compact))
        XCTAssertFalse(SizeClass.WRegularHCompact.match(.Regular, .Regular))
        
        // BothRegular
        XCTAssertFalse(SizeClass.BothRegular.match(.Unspecified, .Unspecified))
        XCTAssertFalse(SizeClass.BothRegular.match(.Unspecified, .Compact))
        XCTAssertFalse(SizeClass.BothRegular.match(.Unspecified, .Regular))
        
        XCTAssertFalse(SizeClass.BothRegular.match(.Compact, .Unspecified))
        XCTAssertFalse(SizeClass.BothRegular.match(.Compact, .Compact))
        XCTAssertFalse(SizeClass.BothRegular.match(.Compact, .Regular))
        
        XCTAssertFalse(SizeClass.BothRegular.match(.Regular, .Unspecified))
        XCTAssertFalse(SizeClass.BothRegular.match(.Regular, .Compact))
        XCTAssertTrue(SizeClass.BothRegular.match(.Regular, .Regular))
        
    }
    
}
