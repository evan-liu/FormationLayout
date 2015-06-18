//
//  FormationLayout.swift
//  FormationLayout
//
//  Created by Evan on 18/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit

public final class FormationLayout {
    public let rootView: UIView
    
    public init(rootView: UIView) {
        self.rootView = rootView
        rootView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func view(view: UIView, container: UIView? = nil) -> FormationView {
        if let container = container where view.superview != container {
            container.addSubview(view)
        }
        return FormationView(layout: self, view: view)
    }
}