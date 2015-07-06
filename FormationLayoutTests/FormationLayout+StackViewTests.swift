//
//  FormationLayout+StackViewTests.swift
//  FormationLayout
//
//  Created by Evan on 7/07/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class FormationLayout_StackViewTests: XCTestCase {

    func testStack() {
        
        let layout = FormationLayout(rootView: UIView())
        let stack = StackView()
        let config = StackViewConfig(axis: .Vertical)
        
        layout.stack(stack, config: config, arrangedSubviews: [UIView(), UIView(), UIView()])
        
        layout.activate()
        
        XCTAssertEqual(stack.currentConfig, config)
        XCTAssertEqual(stack.arrangedSubviews.count, 3)
    }

}
