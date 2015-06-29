//
//  FormationLayout+ViewTests.swift
//  FormationLayout
//
//  Created by Evan on 29/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import XCTest
@testable import FormationLayout

class FormationLayout_ViewTests: XCTestCase {
    // view()
    func testViewFactoryMethod() {
        let rootView = UIView()
        let layout = FormationLayout(rootView: rootView)
        
        let uiView = UIView()
        
        // should add to rootView if no container passed in
        layout.view(uiView)
        XCTAssertEqual(uiView.superview!, rootView)
        
        let container = UIView()
        let fView = layout.view(uiView, container: container)
        
        // should add view to container
        XCTAssertEqual(uiView.superview!, container)
        
        // should add container to rootView
        XCTAssertEqual(container.superview!, rootView)
        
        // should pass uiView
        XCTAssertEqual(fView.view, uiView)
        XCTAssertEqual(layout.view(uiView).view, uiView)
    }
}
