//
//  UIViewController+FormationLayout.swift
//  FormationLayout
//
//  Created by Evan on 3/01/16.
//  Copyright © 2016 evancoding.com. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Cast `topLayoutGuide' to `View`
    public var topLayoutGuideView: View {
        if view != nil {} // View has to be loaded first
        return topLayoutGuide as! View
    }

    /// Cast `bottomLayoutGuide' to `View`
    public var bottomLayoutGuideView: View {
        if view != nil {} // View has to be loaded first
        return bottomLayoutGuide as! View
    }
    
}
