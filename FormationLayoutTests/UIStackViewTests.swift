//
//  UIStackViewTests.swift
//  FormationLayout
//
//  Created by Evan on 30/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

@available(iOS 9.0, *)
class UIStackViewTests: XCTestCase {
    
    func testConfig() {
        // applyConfig() should set properties from config
        let stack = UIStackView()
        stack.applyConfig(StackViewConfig(axis: .Vertical, distribution: .EqualSpacing, alignment: .Center, spacing: 10, baselineRelativeArrangement: true, layoutMarginsRelativeArrangement: true))
        
        XCTAssertEqual(stack.distribution, .EqualSpacing)
        XCTAssertEqual(stack.alignment, .Center)
        XCTAssertEqual(stack.spacing, 10)
        XCTAssertEqual(stack.baselineRelativeArrangement, true)
        XCTAssertEqual(stack.layoutMarginsRelativeArrangement, true)
        
        // currentConfig property should return current properties
        let currentConfig = stack.currentConfig
        XCTAssertEqual(currentConfig.distribution, .EqualSpacing)
        XCTAssertEqual(currentConfig.alignment, .Center)
        XCTAssertEqual(currentConfig.spacing, 10)
        XCTAssertEqual(currentConfig.baselineRelativeArrangement, true)
        XCTAssertEqual(currentConfig.layoutMarginsRelativeArrangement, true)
    }
    
    // StackViewDistribution
    func testStackViewDistribution() {
        
        // fromUIStackViewDistribution()
        XCTAssertEqual(StackViewDistribution.fromUIStackViewDistribution(UIStackViewDistribution.Fill), StackViewDistribution.Fill)
        XCTAssertEqual(StackViewDistribution.fromUIStackViewDistribution(UIStackViewDistribution.FillEqually), StackViewDistribution.FillEqually)
        XCTAssertEqual(StackViewDistribution.fromUIStackViewDistribution(UIStackViewDistribution.FillProportionally), StackViewDistribution.FillProportionally)
        XCTAssertEqual(StackViewDistribution.fromUIStackViewDistribution(UIStackViewDistribution.EqualSpacing), StackViewDistribution.EqualSpacing)
        XCTAssertEqual(StackViewDistribution.fromUIStackViewDistribution(UIStackViewDistribution.EqualCentering), StackViewDistribution.EqualCentering)
        
        // toUIStackViewDistribution()
        XCTAssertEqual(StackViewDistribution.Fill.toUIStackViewDistribution(), UIStackViewDistribution.Fill)
        XCTAssertEqual(StackViewDistribution.FillEqually.toUIStackViewDistribution(), UIStackViewDistribution.FillEqually)
        XCTAssertEqual(StackViewDistribution.FillProportionally.toUIStackViewDistribution(), UIStackViewDistribution.FillProportionally)
        XCTAssertEqual(StackViewDistribution.EqualSpacing.toUIStackViewDistribution(), UIStackViewDistribution.EqualSpacing)
        XCTAssertEqual(StackViewDistribution.EqualCentering.toUIStackViewDistribution(), UIStackViewDistribution.EqualCentering)
        
    }
    
    // StackViewAlignment
    func testStackViewAlignment() {

        // fromUIStackViewAlignment()
        XCTAssertEqual(StackViewAlignment.fromUIStackViewAlignment(UIStackViewAlignment.Fill), StackViewAlignment.Fill)
        XCTAssertEqual(StackViewAlignment.fromUIStackViewAlignment(UIStackViewAlignment.Leading), StackViewAlignment.Leading)
        XCTAssertEqual(StackViewAlignment.fromUIStackViewAlignment(UIStackViewAlignment.FirstBaseline), StackViewAlignment.FirstBaseline)
        XCTAssertEqual(StackViewAlignment.fromUIStackViewAlignment(UIStackViewAlignment.Center), StackViewAlignment.Center)
        XCTAssertEqual(StackViewAlignment.fromUIStackViewAlignment(UIStackViewAlignment.Trailing), StackViewAlignment.Trailing)
        XCTAssertEqual(StackViewAlignment.fromUIStackViewAlignment(UIStackViewAlignment.LastBaseline), StackViewAlignment.LastBaseline)
        
        // toUIStackViewAlignment()
        XCTAssertEqual(StackViewAlignment.Fill.toUIStackViewAlignment(), UIStackViewAlignment.Fill)
        XCTAssertEqual(StackViewAlignment.Leading.toUIStackViewAlignment(), UIStackViewAlignment.Leading)
        XCTAssertEqual(StackViewAlignment.FirstBaseline.toUIStackViewAlignment(), UIStackViewAlignment.FirstBaseline)
        XCTAssertEqual(StackViewAlignment.Center.toUIStackViewAlignment(), UIStackViewAlignment.Center)
        XCTAssertEqual(StackViewAlignment.Trailing.toUIStackViewAlignment(), UIStackViewAlignment.Trailing)
        XCTAssertEqual(StackViewAlignment.LastBaseline.toUIStackViewAlignment(), UIStackViewAlignment.LastBaseline)
    }
    

}
